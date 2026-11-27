Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788844;
	b=mAbSldRJGSiGfTGlpHERU7ormBLyT/zBkR8tvY8jbA5OgGwb+jDXcBs87+g2/4GMclxq
	 aqC3wfB2w7yE35KCgKZhg6+axvvHLxZ9YKMqUr5/80L7pTQBsgVLA7GQkP6NeF0aGBBIy
	 bpTq3fkwi4Cd2FG31ACjupSs2NK6Veo9bjdbX1GESnnifn4SV3pof6XsLFjqgpCiJoJb5
	 8QBPXDmWKGoYiafQaciKEKXVw926N7LalybzeWHRs8mLrEVXnMSJ5oRvqJTnNCqN3E4UP
	 yfzUzt7AQt7N5gHbVLWqRCQrifFa1kE9l17/pxU59SA6phSweo/1Ai74DSarPW2YPfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4BWGfKuysLwJSXZLulJ87yZmWj/glvghmwYmsfRkDVY=;
	b=PJUF6h1KN0avtc5ka8hR4ZRUODiKOcrpLx6RR9Imnzm/Gd6k9iBzgyBkJaE8pkPFXyzm
	 A8eEHNHDt0cpiAVZJ9P/WC8Nog1UYmaw1DqwNvVwd5mjzgtQb1ldJYJHpY6baQW0pRf5U
	 kJGjvVRxumkESZAiCq+/OybmlSu2QGh6QyO2n2lYA9qjX+KEBN8Py8MumgsOWFIXnchfD
	 SaM8lsshPP65XYcDgIO9vYOzZPy1L5X9ttj/xFlxCojCt/8kRUyT1dBL0uFNu01vVRlV1
	 oZz/GcR4/cvjaEYSiDE4QDsS5L5fk7amU1bKtaDEXrlUqrakbV67FUCBleKEoJbO2eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMheY636;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64006606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64006606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMheY636
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so5112825f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795788843; x=1796393643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BWGfKuysLwJSXZLulJ87yZmWj/glvghmwYmsfRkDVY=;
        b=fMheY636nIIJKKzv5AvXhyxzHm9YhTBTwcLZsH5sMYrI7j+a2Namr5FlsDfVgke19f
         iIMiclh220spaQWAHqaUMEXRmp14elucEmcO8HQjujQEnBxLyNT1AOnf/ppyZgO98nq/
         MiRPYAVDvcdNdhzKg+IKlNRDrhnuOhwLIAIat+Yu2LULSLmiqPLoCSjX4pvNG6Vif2DE
         nIZWi0VMCosAGl1F/IGsIR/eoaLWoGO6gNANeIgMl9Yr9ncyLPG8BsPCTsK+iGikyWYP
         vO5RQcbIWDu/DGzicnCp/rDx0doX0RuWyO+7q597TpabrBeMfc72lwTfvrjpg+Zfp1E7
         wYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788843; x=1796393643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4BWGfKuysLwJSXZLulJ87yZmWj/glvghmwYmsfRkDVY=;
        b=v8H7bgypQ3PcW33W92eBRKdZAzViBvPER/rxa7p1sDXNuSXinukGxRcSyXA7GxzLLf
         1mfb8pR+KKVLBGbEJxWoCf5QPXWL+ruwW28u+ThdH+odTbEdJGYW2LtPae8bl5Rlaxip
         3zTG/1mZmDKfwbG7Q+u1uWfsJzB5anxxQSP4Vuw7V4IWNIjkymeHRsCH4OvgMwmQpJ5H
         sLaSrfrSIKlOnHXViEPZQ/ZBxKOnfg3OkasKVfR1khvv4OE5RD2lN45Cf0RUfTIBkKE1
         Uf5mf8s9SZzW+zEmB9YoqXeDd8VyFNfe/3v5HwXx1UJEjfyLpBHjTYEry4rub83N47w0
         u+JQ==
X-Forwarded-Encrypted: i=1; AL+hErEm+uuvYdH+aZwHpD/ugSkSVgCydO47i3TyzCjcmEhoqe4fAlh7Ly27+WAqS9B4Izu2Lb9MXIHH2XOa4ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vMVyuiD5acdC6mxZ8PQ+N5ukpfKkdWeNjLuVSTUjoRAXKBqDS
	RNTw3Ofs2pmZ7Oos7JNM0E77CytZMjgeiry18opGq0mlTCY/vamrBn2C
X-Gm-Gg: AZFdTZfKPZmAwTJPKLSAIyNt1hVIIIraULwkygF0eLHOLbaDyLGoBKJ1CxYOARP5MZO
	I3lxQKLBOa/vmwsqJIm0WYTSJPfrcyZwohXwE5+H08RLwp7TmW8U3rTcQ7EPkVz/9Z389vclOQt
	T6e8GfuvMorX/IHaneraGK5D4l6dUu77qyvs2+9zADQqdvlLEchdAPv3R0UL/1f1/knzHPrLjM2
	WID/zChIcWFyI9eneE3vhLEslPLhLlBNdK4Q3O711C0OT990oVanjQ+g8hnrMTQmpwDL2/pNc2H
	qModR4aLB7o9sgRqlyNPmWqMfSEwX70yljl71IkJc1/4ukuSEKPkFZKyv18ypuIHQSgbPke0Gz+
	oAy01d2ceyQWlSAYkkMZ1Y8+0AmQCV/wdpihVkbm0P8CZhEaY0tsBAtFuKzEtFfm3occdXPChvI
	BcGo69Ts5vOdcrV+3u0jG3LGGH8XKRh9nTA9PnAvZWUF2hyouLYFzJ5xmBx7tLP07ZEXoT36I/H
	gaqVQJ3V7trVl/ZiZpPNbUE4KvfBHy/wr3iajvOq9sbUxavSKQYp1G4E2RjsP7MvbG8zMGQhwXz
	OuSS70s3mnCAHdGU/2Vcx9yILusRdFdg5mw=
X-Received: by 2002:a05:6000:454f:b0:4a6:d298:832a with SMTP id ffacd0b85a97d-4abb31ade9cmr29618487f8f.30.1795788842509;
        Fri, 27 Nov 2026 06:14:02 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm47588546f8f.42.2026.11.27.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:14:02 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in AP mode
Date: Fri, 27 Nov 2026 15:14:01 +0100
Message-ID: <20261127141401.1872285-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <84030084b4f24c4199a85cf05fae10b0@realtek.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

> Have you actually tested WoWLAN with AP mode operating CSA?
> If not, I prefer not resuming CSA.

No. With an AP alone the WoWLAN suspend failed and cfg80211 stopped the
AP, and with an AP next to a station on USB the resume path never ran.
v15 drops the restart after resume and only stops the countdown on
suspend.

> Create a struct to hold these CSA data?

Will do in v15: struct rtw_csa in struct rtw_dev.

Mehmet
