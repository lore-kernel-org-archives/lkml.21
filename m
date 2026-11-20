Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188690;
	b=FbHPcKuSVQtXaSHYKPGrNK5tSudyUuV+kJ3FmLU+kacmQapbVrKFqx8unaI1VTKL+dqA
	 OIXnqrvzSafvOAWcPBU291gDPJuvwGMAYpZt3bMOYWlg88MfVUuNSM52bnBZLAIT9llkC
	 udaKMA3vApWt2p6kVnpAOtm2r6ji63lSbz8XlWX4R7POYPzkiOV6vD0LFQoExMV058Ci6
	 tayKnU1JJiMYhV+Q9TDGlFON7FQwGPCDZn6mfwNP4ozNIQ/YI48anSdzZc1+AofuMq+r8
	 MXj5g7NtT35m1MivheNrcSR8taplMdsrp8sq7r/5D+M8vuaL0MXsgw3F9L3fmKnIkng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
	b=z44CybbVTDBEO0f0wpVeCfqTsg/HtMqoA126DJVg+TglKmVDgzUTCKTP/7vkO0eYO0/4
	 PkJ4dYjf+GsXDMNC/36Vj3/uFEZRRCZIaek3+Xu3Y5RgVLJrzppU7/2Inioe4vAaAZw4J
	 taPBA44XGiRi2S4NNhdH/QAExzfaY77aXkslNw7jGjus8bUdBTF+Tgjz9Ms/REbg7g6px
	 GGpaoTGiAqovvZ+W99zOuBpekh+0YGoHe4aLznhUmajWxYrY0RfXXFncFeuPbdK5xgDYD
	 YVwDWwfBiXB2PAqDgYTtNeTrSWRxTFUDWp+CxHjI4trkM/pgAJqBz0KJzvkr7L9oFwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYiUfnZS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3F2606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3F2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rYiUfnZS
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3712b6d9843so970986eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:31:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188689; cv=none;
        d=google.com; s=arc-20260327;
        b=VQApX2aL2A99pD44fF15mm2JMRnV4l9QBLJTEO83VkOz9NVhld1cBxBDO/Yb2ZVSdT
         oco7uQojXUlZ7hknn32XnAr02hE3gupTP9CHI02VjngxAxocy5GQX2MXYiRIG7OkvGaP
         Au2MAfD2wNuSxJbQe4Mgydvsohf8opBLLOeDLMKX331lQJWL16HKmAF/z5kviFXCCYfn
         JZvhq6TC2dUw7i3k3KwRTkxDIVABwVExd2XCIlfa8KA++MuQGIE5pegdBQsPgQgbVIkl
         9bb9+sVdIiGdcw4IUZDF8fZN+x9gQXkdimbgXEjYKE1WDhMR6rIpPjeLkz9SHKt8oLDy
         tJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        fh=G1eotGVWkuEccYzatVLlz978IIn3/2Y7D1LE2dQzdKA=;
        b=JDEhbwLYYIk1BXLjiMnBc75xuWaRW8HwWRHR2FL47RP8s7KVstGbsED1mYvzb2y0Y5
         DvLKDuhyMsu/b8Ctp2PhxnjkTwOo4afPRhRkY0o/IH+P0Z4juoA0VkeMte+jaQIJhPTn
         2xPrCL8/FcILYuPTc/DRQ8lgh06oqIMNlWgY0WFfw/cwpX03c3hhXIgnY9fyfQ2z40N0
         2k+QKeTznK5DsVPlI33ws54Pg9RH68xzHYsrdUEaEMdEZ/tJHc4cmY1QNkGKKOXjP39R
         leMM3eItBTFuWSBpf32OkdOdN+M6qQ73ysjsU/4Sh9Z1wwawAr4QTLC209uN/aSlbcmD
         KVrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188689; x=1795793489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        b=rYiUfnZSuaoielxLAtDf6tRtT09b3z0BbTf3Snshk09+yIK85WTu2JSCR8wJWNFFyE
         BONIXUlNMREfqT8nZtaskrOX9zSYxi5AXvSf30rqFA66oJ3LYHi7J3Mvj5THz6yVbEDE
         iK5wnp8bWy13CPECQBGqxn+SElETm1hRIy5Qam6OqXUD78v+dd6R5PcUnhTiC4ynJ+6T
         ZwdF3ery1c9v5wDocw5m2zc0VAUoNmiEaKySbXM1G28Z5oMGiNN++MUS0Fq9qykbeQuj
         AIBkQy/5BAYptgfXI0Au85iL2L2BqDxHptajlHv8Jnbkj6e3aibZBPHiotbwD8DmFSVd
         qCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188689; x=1795793489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJdGxpeLcA+HNojMQbXEX8uXEAU5T/sehUXMK1DtacQ=;
        b=nP9B+LjFYrU+O0AU2VgUj1aKtXX0fVZ1YBP9vsn5d3zErESjtxuB5sQcIrxmjONA9h
         VCNQydTQQo7JTTiDMiU+jfp/CIEBH9sIsqGa4jZdPS3LBAHq/rB6rMqKscW9MQI5+ZAA
         odHs2f1Uz1wkFmOZaQ6GQTHLfEO3+a373YTTOGMraVzzj/5cRFGmxfHofuKaOj5EHCVo
         LDl38DeLK7aY8T4Z6tTcopTZNEXmGUgRjCO4Y6f0XqZknWcGcaUV04fhOyYse3Ziwq5W
         b8jOpk9Yfbqi1s3kDh4zpmwuDYqGYA/y2B7Y4/pxRR3U2er50DKwNgXhZQMrbYkDCX7+
         jSQA==
X-Forwarded-Encrypted: i=1; AL+hErHcq8mzwHxktotOZkCdjSmVcIkGu6faFhj8LPXuwN4MqZUQHIHcg9ujPivbT8Fh96CXDBx2mtf3RFFXJ8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BO80rPXa8IEiw3zKd30SzOEqljev1hG35DMFr0wFWYq0ZR6jy
	D2vTCXkASxgM77xfVPPrTQScV5qG5yW0MsGQgjFQEdDQGOMnQyubGsRjfbhWLLWdgukMg2pra+t
	T23dx1tdT3EHvu9XEv6Ff3UT1O4qgzvPXJ1ON
X-Gm-Gg: AZFdTZclT1OvUT9tpZs4ZBubFje9tckVAwNBNRKBaNHU+ZdPB6UtTSzTjfHOF/N5f4Q
	C8ITu/A6kB0HH5zXivcl+fTpemkB1yXfy2M1wIrBZpLvQDICZBoNB0zCdwgli2oCVdVsUO4TLNN
	2B2c7rU4fyI8Vv7zjEwjVc3gmQAt6aqlySIxgG/5beM3X9ghty7isO2BUvxbMipwdkG05e62kYI
	URFW5I2fRZfUWJ5E/jJeZpnjSWyIKjaXOftRVH9URygk7wLQR7nU9d+/FLTZaehGFBXYJD6XR2f
	nCxCGjqYq+lrwOpTABdk2C0C7w+07Dr448XchUQZWPYudjWUj1BWXhgAgU8/h3nGmX/69yLjEkx
	yo1cm7aom3MepGU+Yxd++aNZjrsDNV7IZBp+XxZMwg1iTVFc95T6EyHoDOHl8+S8s1L0E93TeWb
	1p4YVJLphgavBfY5k8z/31ds+oJY9WD1JdirQ7QR8Wjz73QBnnoag=
X-Received: by 2002:a05:7301:6408:b0:383:1bfc:f1c0 with SMTP id
 5a478bee46e88-38570f27a56mr3129077eec.32.1795188688670; Fri, 20 Nov 2026
 07:31:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-2-clamor95@gmail.com>
 <20261120143147.GA2466366@killaraus.ideasonboard.com>
In-Reply-To: <20261120143147.GA2466366@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 20 Nov 2026 17:31:17 +0200
X-Gm-Features: Aa3M54rmNUuNZyda5qhpJslp9i1jTMK9Hg275DVhPVt4wZMMMc9yhIUe9r0PTkY
Message-ID: <CAPVz0n3u3oe1+H_w9jE2afb9PQT0VLtYVqfHeVNc3D+tLN6NDQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] staging: media: tegra-video: Move driver to media/platform/nvidia
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 13, 2026 at 06:18:10PM +0200, Svyatoslav Ryhel wrote:
> > The Tegra Video Input drivers are mature and developed enough to be mov=
ed
> > from staging into the media subsystem. No other changes are introduced.
>
> The driver should at least be converted to be MC-centric before being
> moved out of staging. I haven't checked if other changes would also be
> needed.
>

Does the media subsystem deny video-centric devices from even being
moved into it? I have not seen this restriction imposed; could you
please point me to where this is stated in the media subsystem
documentation?

I would like to convert this device, but that may take quite some time
and may case regressions if not done carefully. This patchset apart
from moving to media is mostly fixes to work correctly with mt9m114
and tegra114 bring-up which is quite simple and straight forward
change.

BTW, may you ack mt9m114 get_fwnode_pad change[1]. I have updated it
to your liking, Sakari seems to ignore it.

[1] - https://lore.kernel.org/lkml/20261006153619.304520-1-clamor95@gmail.c=
om/

> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/platform/nvidia/Kconfig                           | 2 ++
> >  drivers/media/platform/nvidia/Makefile                          | 1 +
> >  .../media =3D> media/platform/nvidia}/tegra-video/Kconfig         | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/Makefile        | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/TODO   | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.c  | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/csi.h  | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/tegra20.c       | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/tegra210.c      | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.c   | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vi.h   | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/video.c         | 0
> >  .../media =3D> media/platform/nvidia}/tegra-video/video.h         | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.c  | 0
> >  .../{staging/media =3D> media/platform/nvidia}/tegra-video/vip.h  | 0
> >  drivers/staging/media/Kconfig                                   | 2 --
> >  drivers/staging/media/Makefile                                  | 1 -
> >  17 files changed, 3 insertions(+), 3 deletions(-)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
Kconfig (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
Makefile (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
TODO (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
csi.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
csi.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
tegra20.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
tegra210.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vi.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vi.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
video.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
video.h (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vip.c (100%)
> >  rename drivers/{staging/media =3D> media/platform/nvidia}/tegra-video/=
vip.h (100%)
>
> --
> Regards,
>
> Laurent Pinchart
