import { useState, useEffect } from "react";
import Player from "./component/Player";

function App() {
  const [songs] = useState([
    {
      title: "Titaliya",
      artist: "Hardy Sandhu",
      img_src: "./images/titliaan.jpg",
      src: "./songs/Titliaan Warga.mp3",
    },
    {
      title: "Nach Meri Rani",
      artist: "Yo Yo Honey Singh",
      img_src: "./images/nach-meri-rani.jpg",
      src: "./songs/Naach Meri Rani.mp3",
    },
    {
      title: "Care Ni Karda",
      artist: "Yo Yo Honey Singh",
      img_src: "./images/care-ni-karda-chhalaang.jpg",
      src: "./songs/Care Ni Karda.mp3",
    },
    {
      title: "Burj Khalifa",
      artist: "Shashi",
      img_src: "./images/burjkalifa.jpg",
      src: "./songs/BurjKhalifa.mp3",
    },
    {
      title: "Tango Del Fuego",
      artist: "Parov Stelar",
      img_src: "./images/Tango.jpg",
      src: "./songs/Tango.mp3",
    },
    {
      title: "Take You Dancing",
      artist: "Jason Derulo",
      img_src: "./images/TakeYouDancing.jpg",
      src: "./songs/TakeYouDancing.mp3",
    },
    {
      title: "Daisy",
      artist: "Ashnikko",
      img_src: "./images/Daisy.jpg",
      src: "./songs/Ashnikko-Daisy.mp3",
    },
    {
      title: "Dolly Song",
      artist: "Partz Grimbad",
      img_src: "./images/Dolly.jpg",
      src: "./songs/DollySong.mp3",
    },
  ]);

  const [currentSongIndex, setCurrentSongIndex] = useState(0);
  const [nextSongIndex, setNextSongIndex] = useState(0);

  useEffect(() => {
    setNextSongIndex(() => {
      if (currentSongIndex + 1 > songs.length - 1) {
        return 0;
      } else {
        return currentSongIndex + 1;
      }
    });
  }, [currentSongIndex, songs.length]);

  return (
    <div className="App">
      <Player
        currentSongIndex={currentSongIndex}
        setCurrentSongIndex={setCurrentSongIndex}
        nextSongIndex={nextSongIndex}
        songs={songs}
      />
    </div>
  );
}

export default App;