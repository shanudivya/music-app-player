import React from "react";

function Detail(props) {
  return (
    <div className="c-player--detail">
      <div className="detail-img">
        <img src={props.song.img_src} alt="" />
      </div>
      <h3 className="detail-title">{props.song.title}</h3>
      <h4 className="detail-artist">{props.song.artist}</h4>
    </div>
  );
}

export default Detail;