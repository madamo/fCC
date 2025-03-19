require('dotenv').config();
let mongoose = require('mongoose');

mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });

const personSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  age: Number,
  favoriteFoods: [String]
})

/*
const Puppy = mongoose.model('Puppy', puppySchema);
*/

let Person = mongoose.model("Person", personSchema);

const createAndSavePerson = (done) => {
  let testDude = new Person({"name": "Test Dude", "age": 23, "favoriteFoods": ["pizza", "bananas"]})
  testDude.save((err, data) => {
    done(null, data);
  })
};
const arrayOfPeople = [
  {"name": "Test Dude", "age": 23, "favoriteFoods": ["pizza", "bananas"]},
  {"name": "Test Dude", "age": 23, "favoriteFoods": ["pizza", "bananas"]},
  {"name": "Test Dude", "age": 23, "favoriteFoods": ["pizza", "bananas"]},
  {"name": "Test Dude", "age": 23, "favoriteFoods": ["pizza", "bananas"]}
]
const createManyPeople = (arrayOfPeople, done) => {
  Person.create(arrayOfPeople, (err, data) => {
    done(null, data);
  }
)};

const findPeopleByName = (personName, done) => {
  Person.find({name: personName}, (err, personFound) => {
    if (err) return console.log(err)
    done(null, personFound);
  })
};

const findOneByFood = (food, done) => {
  Person.findOne({favoriteFoods: food}, (err, data) => {
    if (err) return console.log(err);
    done(null, data);

  } )
};

const findPersonById = (personId, done) => {
  Person.findById({_id: personId }, (err, data) => {
    if (err) return console.log(err);
    done(null, data);
  })
};

const findEditThenSave = (personId, done) => {
  const foodToAdd = "hamburger";
  Person.findById(personId, (err, person) => {
    if (err) return console.log(err);
    person.favoriteFoods.push(foodToAdd)

    person.save((err, updatedPerson) => {
      if (err) return console.log(err);
      done(null, updatedPerson);
    })
  })
};

const findAndUpdate = (personName, done) => {
  const ageToSet = 20;

  Person.findOneAndUpdate({name: personName}, {age: ageToSet}, { new: true }, (err, updatedDoc) => {
    if (err) return console.log(err);
    done(null, updatedDoc);
  })
   
};

const removeById = (personId, done) => {
  Person.findByIdAndRemove(personId, (err, removedDoc) => {
    if (err) return console.log(err)
    done(null, removedDoc);
  })
};

const removeManyPeople = (done) => {
  const nameToRemove = "Mary";
  Person.remove({name: nameToRemove}, (err, res) => {
    if (err) return console.log(err)
    done(null, res);
  })
};

const queryChain = (done) => {
  const foodToSearch = "burrito";
  let findQuery = Person.find({favoriteFoods: foodToSearch})
  findQuery.sort({name: 1})
  findQuery.limit(2)
  findQuery.select({age: 0})
  findQuery.exec((err, docs) => {
    done(null, docs);
  })

};