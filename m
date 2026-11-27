Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743822;
	b=0DyfdfYfgn6cr4I2o6Ig3gdNFsrSkfy+RD0wvFa/QhQdevwS1xfcVT7bSnMls3KcYmj2
	 TkzzO/eM1HoKg7+hPxkFPEk10vyeEn/HUFEZDjdU33K3fXMlqfCP6V2A4d0bP7T1kZ6A/
	 2oQktgBR/zinnm4L6gPDqz/Kp0TMzUEQz/36uayxVBmVTMVlfiLiONJ1LqAPv2XxW2cWh
	 +qWOJ14+S+dnKvH3LySHez1KcFU6Yk8om9i/oCyJgk03jScn/J3Nlju+/IdoY8VGm6FUW
	 /I0gsPgAFMr7nMFMFLuRim4SeIp7hit7zMkR4BuSwNCeeLy6r63yA+hIw0Dp6vERb3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
	b=gOz2f2oSQQ49c6yyluEiqi1WyT8GQZNu9arC2337idV5W7UOiqZlj0JIiTEifnwqs+kT
	 u9eQ+bxZG1+bLsciXM+Um8FjrhBogQJVQ1C/7uiR6aIaAoKdvklQfeXyAwFyhhyU1yrtR
	 9+aboUko+CAc0jTa1krc7Oit8r9hU1tFHCOsjlw6mJ95dYpwuZFzJrtJUeP+gXt+V6NxJ
	 v4bHdQFxtx+0gEDAZ80r0osNd3Uw/gu6khZXD9XX04nZH8EZ/OsIpzPTlSsmdoroLFTPT
	 Jk8nK9yiVhC6k9vld4aNWGjVWKMQyCyJTeOW/sgyhm9SucrFqpG0X49Ugqwsk3P4erw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Td6SkLxc;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055F5606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 055F5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Td6SkLxc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso22587585e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795743820; x=1796348620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
        b=Td6SkLxcn9eWYx0TTZRt45GBCpWkmCEJasmmahp48hZWgPxdYfJdvOHzacpPU/9DXP
         gNq9/bFDP8dORUPZ1cBHnlLAZmVhbXrWhmbqZPCFbFNYjmAvO1IXFi9i/ihyFfplemii
         US2zzb7xLxpP9FQ8gJv7pDTCDN6whHEa9ZDKgq0hMHiUyQ7lUoKwogpfUpVnGJK5BNz3
         wLjhg37j4qXQgpdqgOcvwK801IqvW9ftssKIYrr7KB8ACJ6L1BnV5oRhGnpRjl25fYX7
         BeP2HSDicJ+NuvDlU9hUWJKUmpebuY/d1TpiSSS3d1IFvUOKQH9pgQ3sjQRoLPFhZrcO
         0RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795743820; x=1796348620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
        b=MfkNIkZc3na1cbt+wjk8QXULW91aDC0D3gO7R5xA3k/NdmqFrD42++776bs90bTrzF
         CvfrmN9JA0bGl0F9Y3+I6MNKsWycbpFRm3IW4XJAtqirFcYsUJsVQA9yiaqoIM2M6Ivu
         upFzYuoxyb9De1PatJ3QbsKomwe+DX/FCwIHVatSGfbhKpuNl91vT6SMQtX842DW8/u2
         9LFbNqZdmGRYagKClsLiayzrj1i4R89SF8XjZPhqu4mgEsuR+5OgS4rI8RA/cJmemjJH
         lnJFPlInHOYilfFNh5a5u5JM6eiP46ne/TaBbodxXUuxkVxi5VDR3d92rhh8gLEu6/TB
         RLjQ==
X-Forwarded-Encrypted: i=1; AL+hErEnevqxAGlJpAvMPpgds1y9sYOSNrP/acKIrvPMuGsPG3oMGYnRd0Ji/bje5/V+M5doKH1ndP/A3wDWt18=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NGMY88TeFkGJsDiEyk5IvvxvqdW4f9pIEvuHQmwVRuK130fk3
	bNV88dJxIDbMjvNQ3OPFdrs/dXGWVoutaide0TzyPScL291HOFmQmfCl
X-Gm-Gg: AZFdTZeDHXVq4kDMr8bJqNJCzuao7DeBpQ7KvJyzpl07NSVh5zQRgo00lAm+R6HH3Tw
	t/0upT7OsDThzUDTq7qsrXp3t1W3+/37PtmhbzxqIRyGP+PqGh9jyIt/I5Cqv66Sowv0JTO0yIN
	zfeznM2qnXrOhUAZvZfCzjrzu2/MU0Cv0Avk6lSz9WrpD+Fs89TWPVL3Sme4YVpyZLKp2dx7pVH
	XHbmkh66gU9UX80c9lVZkjwUqyGUOTe8p1y8hR92aQRm/5OQCc3QL5MNGwNzQqStk9FrV5qd3BV
	5SKUUOZZ0RI1IASkKXTm0sgz95yDsfVzoiD1BWgRzr7fmHnu3AvAvtTLGsrofNM2sV1czdM+Cbk
	keE7/EN2c3lFARqk9I5SQ/yZhh4WA+NhugGqOKb46VUWnnNZ6HPIKBRxq54WPLiGXw8GFr/H154
	veG4p3ku6zd5PplWj0+2V5v1Huh7OIgmPYfj1bexuy2PUgdFNCJ/AHemSu+4flssMSzftxF3v4L
	6Z4jmiUtjut79V0nf+XEMUlET1HOooC7+YYNUUq7jPmeadJjYm4yziyWpil9s/sC+e7qd8SXYsI
	4TQhiEx/Vy69mmycUN7uB7vPSe9CQhReA00PLXmOvZjBZOpiBKagh3JPYy+Cz2DiBaFD7CkEueo
	Cjcl3G708/NSniGs46MYJUgNkiFmZKw1z1n1EDxaktSF8ww==
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr521380065e9.13.1795743820179;
        Thu, 26 Nov 2026 17:43:40 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm385176475e9.5.2026.11.26.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:43:39 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion control
Date: Fri, 27 Nov 2026 02:43:39 +0100
Message-ID: <20261127014339.1611234-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179476597358.140154.17606905713832103924.b4-review@b4>
References: <179476597358.140154.17606905713832103924.b4-review@b4>
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

On Sun, Nov 15, 2026 at 06:06:13PM +0000, Mark Brown wrote:
> What about the configuration with both set simultaneously, so HPL = L-R
> and HPR = R-L - that's fairly standard with an actual mono signal (ie,
> one channel as opposed to two copies of the mono signal), doubling the
> signal over the speaker?

I tried it on the PocketGo S30 (speaker amplifier bridged across HPL and
HPR), 7.3.1, plain stereo path (AIF1 DA0 "Stereo", headphone source
DAC). Bits 1:0 of PAEN_HP_CTRL set while playing a tone on both channels
and another on the left channel only:

  bits 1:0     both channels    left channel only
  00           normal           normal
  10           louder           silent
  01           loud             loud
  11           silent           silent

With both bits set the speaker only gives a few clicks, for the
one-channel signal too, so on this codec it does not give HPL = L-R,
HPR = R-L. It does no harm either, so there is no reason for the driver
to forbid it: v2 will expose the two bits as independent switches
instead of the enum, and the S30 turns on only the left to right one.

Thanks,
Romain
