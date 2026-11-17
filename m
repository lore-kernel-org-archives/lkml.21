Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794949483;
	b=WgdHRbB6HF2Df9RgM/Nx9IAHXDP45koW981jaJehzHOXq1+7W3kyKTJNfx8n38+lL6in
	 un7i3JGFwgP2co1X5ipvNvN2xWMAjgLXCVXSTiQUv/1v+ZTngAM2InkVLLJvCZhd9KdLz
	 MnRP9OTKa0iXhFayRE26ptL8YUC49mdSecWrZjWdJEdzvwPi+OD8lg8n62DMdKktzE/o9
	 nrk66AMPDZhuurCNDrOEoV8JJbUMZ01otRzQ+McvHdGRtyZ7fGHWzQ7i/JbHzkVx8ufxB
	 yXqsjtXfJo4NaSINGWBD1uwUzcItnnPKCbddGsjcVclcGFXWABIRTd91cwZA/FqND0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UYXMpCZr40JhLgjGFCs7B67ao93hJVuGowdVTlsw5RA=;
	b=PXd7B+SU/GorH2aAtRUKIy6By7mqCtWuqXYPHcAFE3SSmSBi/nWD1ndyXpgSeNIR1DK7
	 dLiUctyjsmNqqI+wenmrVh1hK1NJ3uc9CCeGUk2xtYqp52WRG/o2zlu5irtaoTzSzo4Zh
	 jFuq6iKyot2ZWHtA0sap3XdQ/z14qvbQKxUJFcnckp3SD6yj8uEDFF002LRLHDjcYG10S
	 0V40wmfFl4gmMsodWtSDDsb4OGiyizliFCbKUk0Qynpyd/Vux7alakUVmZQZCBL1Cho4f
	 bf28tCB3KmOh5M4Cu6uQOdm11UqYIEEWJLV73VKPtAs5Cr6NkC5W9SUOt71sNYCS61A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jG74IsKA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D303606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D303606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jG74IsKA
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab46699a09so2937911fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:04:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794949481; cv=none;
        d=google.com; s=arc-20260327;
        b=dw9PlQ8YVL8P1E0uEwu9IhdxrZ1V9yvp+F49pJnIcBfC40gyG8C+COh3SO06V9D4AO
         eHJCBg1V422xtkfgO4qbsSKmsf60cxOXgCzGepBM2nZ5l73F81JyrrIj+Mk4q0qu0ou/
         I2p8BOJJbNgg0yvzLRntNplyOcs5/sWOE//Cj+aCBc4ScknxHyqT76BjV7s1bkPyHB7y
         aXilRThG2DQSSnRvCNK5OyZSSY8v3KX+IHJj+0pRujpvPxF0mGKj6xpMjKd46GCo2NSH
         EsrNUamoZ2SOcNIcfe0ftIU6vXAVvf+GRkENsitiASDlLhjZbRhKncFr9gOGT4Bg9aKL
         VnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UYXMpCZr40JhLgjGFCs7B67ao93hJVuGowdVTlsw5RA=;
        fh=AZJRooDKGFMsHVKC+tiKD3boU8Onv817NMUM9wyaM50=;
        b=CeSuavoxbNMZq1O7dDJHOSw8nrwjauHsKGZI4vETn5MQt+KDrM3AEF9vyMChchauUE
         pneFoZWBHgLIahvdLAoykwOogHVsGsTGv91XRgt0hM5EYu/d4RlJ1Jcwm7S7apvEg1TM
         nNnvtjU4XR+p0l3LxlYDpndCLxiXVeqK8eKZSyb/9VPyN/MiFR6wrTNf8VuwhSAdVjae
         iJST8IEekV58C2CY3O+1EmT7RpMENAN6bezVoZ0P72K2uhzXuN1bxbX1to30tdVem50o
         Z/ueJR4iktxHpl7kh0kJ2lC8OqXVbgrmdLhCDhFka/S3Nq4V+ZGPXckKJw0aAfQ2czVK
         JLQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794949481; x=1795554281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYXMpCZr40JhLgjGFCs7B67ao93hJVuGowdVTlsw5RA=;
        b=jG74IsKAU0/3eUBXAExrzTbZvexpgkxvKHo6Fjnf0wyk7akctPyR2gZXYVMnu2GnMz
         5TBfqjm4aezdPWBFwye1vWmJ4+3xsoNVwagS0VDPuWuq99TKGpKVmIlfbPHUoy9DAeV4
         Jdy7tg4yMsosDy1QIJTYmSsgy514vTL87phXr0fHhjGRo16NeuzVXOmbPz/+oX792gcZ
         Yt57jmcHPlk/SDRbvnBefMbC+q4YmKOUdekUWlQVkOYRViFMPvuYKNmiF0A3WfV2TALu
         32UmsMB5Kl1r+gvtxnRnkQYRybV067vsf2kbE9Y/wjY8KCgao7i8b6kyxDNO/jMzEDVg
         HNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949481; x=1795554281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYXMpCZr40JhLgjGFCs7B67ao93hJVuGowdVTlsw5RA=;
        b=eXXLrjXQL219s3r5oSjbzaeeL03C8ofooOKbiGhxIJoRxET0A8ANer6dx6jFTB0YPR
         LL2HlEYsjaU4uX4O/lT0HcpHB7QgN6t8n4wvvv73V2xaZk+vcd8f80CTg/Rt3nYLBeOF
         7RO9Biu5Qk1alePYo6KNR41gpgFWq+A8zlVbI2+b7r9Y0lheP9QIOHYf6gx1l7VKaFHb
         rZIAIEkKsbNlRg5ljjHKmawmvPkmXhKZBLPmpd7ZdMWeDcRsmTWNSu5Mk1LJGNPSlkgd
         sg2ZIceQtL3+KzJghd8AWyXlqFT8Mj9eTR9mi3FsTQk9WaA2p3MjbHJZ+naxpsn6OOEi
         NFjg==
X-Forwarded-Encrypted: i=1; AL+hErHxnMU9LqEPlI84ZbVO//MATd8kSdRvaby2vjWg722zrjxzFGTK7JYTysBEZc+3gR9iTAQDnVc+kcQwxIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6qsRXBj39isn7H+o+LfRrF0jdcOSIEnjX8JCJud8PU7sDDiQ+
	99niiUvLkWNXhBCJc/5hdyLqtEohNSWIiN4j+1E2VxPOjxXekkJPTbxuBfh0qg7UvweVqm+k3Za
	D+EtnYY4He3vi0Q0zNAWU6JU2VMtccX0=
X-Gm-Gg: AYBFou3aov3xHcpw6c5BNtZFx8ue1e4GQiHnsvL4T/5Ef6p5guZC2zD+Kpo1HZwM2le
	dyKdK7KVlR3ghusmm3wo381Z1+CjeRtfSebEZMPiN/y7XkqEYGvrOyadWF3B4YHXCNUilzqsPVZ
	7ogPmoZP9MCIATNramrjXPQ8XU1m5twr4wb9N7T2C1Pa+YGsEH1xtjSFOg/C037001I/rpp8eN+
	uPlD+GEn07Oszt81d7kOdpGy6oTE4Hf4W9LkE9FC4Tfb0tf4vli7KlrkUWDEnRgbnkZSB1ofIp8
	+Ndw5BqMlKmlKdUme7/c/jcja21YIlljkeM6APgCn745rwdFZoEyPzGK99BUX3MLoMFhfo+9jxy
	FUPN++ZSCM/CLSUP1iBMmDNhaaTIWp9TEGVWKES3rAEEubvKHCqDLN9+JUi+7Qw7uRiD1oZvH2y
	wm8e26zPxvG3Z7P5FG7OktyfevFWjkuxSkvwd8/ZQ=
X-Received: by 2002:a05:6512:118c:b0:5bf:d004:a84d with SMTP id
 2adb3069b0e04-5c1a9b70550mr122321e87.5.1794949480966; Tue, 17 Nov 2026
 13:04:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115015219.476559-3-sanjay.govind9@gmail.com>
In-Reply-To: <20261115015219.476559-3-sanjay.govind9@gmail.com>
From: Sanjay Govind <sanjay.govind9@gmail.com>
Date: Wed, 18 Nov 2026 10:04:29 +1300
X-Gm-Features: AclHuK-YeRKPckIXAFZH6ie39-_0ZDn6-uOE1PNiW6KEE5xGGdUAdQd0J3K3qEk
Message-ID: <CALQgdA1_1CuP2nYfCbt0Vzyn1ve-ekCWm8U3YQy6eRBXMr0m-A@mail.gmail.com>
Subject: Re: [PATCH v13] Input: xpad - overhaul device data for wireless devices
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sanjay Govind <sanjay.govind9@gmail.com>, 
	Roberts Kursitis <roberts.kursitis@azeron.eu>, Krzysztof Furman <krisfur@proton.me>, 
	Dmitriy Zharov <contact@zharov.dev>, Qbeliw Tanaka <q.tanaka@gmx.com>, Shengyu Qu <wiagn233@outlook.com>, 
	Erich Sartison <byt.es@mailbox.org>, Kees Cook <kees@kernel.org>, 
	Elliot Tester <elliotctester@gmail.com>
Cc: Zoltan Illes <zoliviragh@gmail.com>, Bihaan Sen <stevewholikesthings@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:04=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> [Severity: Low]
> Does returning 0 when packet->pending is true mask a failed submission in
> xpad_try_sending_next_out_packet()?

I will fix this in v14 in a few days.

While digging into the XUSB drivers, I realized that wireless flags
are reported differently than wired ones. Therefore, I will also
remove pulling the FFB flag out of the capabilities report, as for
wireless devices the only place that flag is reported is in the
subtype. I'll include that fix with v14 as well.
