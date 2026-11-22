Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343779;
	b=wpoZ9nnrfaHEEbA4e19BsOn1kxqeqbTn6NNNSbFM/zlG0VXoZOhHmbe0M8OI44nMY+yD
	 9FGBHt6zUSmvnd0LviPkIjOCgl0tSZmiDOtoIh6W5ycOwn7UWY0ikULkC4F/24UILQPQB
	 uXdL+cKMdPYd73So0ldV3bHFJ7iC0aUJPOfhBZBtpNYiK9cT380hCpHkT0ep8JbKtJKZB
	 Tbb0rQsrEMjjQlXVlcSvepp2yaYgUUwIhuddTp8OZgqXzgJI04abGs0NxeodpXe1G82WO
	 nZ0dwYLgAatSrKvRjPF+3G+ytc9krlxOPIhDhFg2au1NGV2KPEJwMfLq3F7xGmLRBHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0lnyrvg2AxLIGfrYkGZJCyPnrsYHo+Bp6WoUstIMnvA=;
	b=IFYqjqoXJl0U2tk0H6DMuoOf7HD3ttnHrnq7BBblVxfKS9ym5JOLheWSDWUvR7kc602X
	 mlAb/9JLj11W+2LSxbjyp5lqccx4sZblDKZnV/xv7/s7Ntnln2tzhf/GSzFgTaZa88G+U
	 4cFV91dvVe/XsvXhoiaRsaqQ/tglXrDOL1t3osFrTbTX+qTX4HVx+A3IkmlUXVFCUZxki
	 QwbeVzizTAt0dmOE3UpfsJHKqouAOuG4S29FzgPbq/rXEQPHlQ5vdK+ZoE4ho3c2Hv82s
	 7R4y1ya2Fi+KFrcyv9zrO5BBix890xmNMNv0UdC2OuPM5xR9lasRzVa26ebTnHQdLyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NHbP/zuj";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975AE606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975AE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NHbP/zuj
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3863db981d4so2943514eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343778; x=1795948578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lnyrvg2AxLIGfrYkGZJCyPnrsYHo+Bp6WoUstIMnvA=;
        b=NHbP/zujJOpVBIV0m8IFi6zdapbIMuZEKUzKc1Mcw/QTHVdtTDlj+CNCR/eMMP7PDK
         dTSb3zc450m9kpRmzdWCMUY/VKxgf12GZJiZ38U8P2EqmfaswaB3NL7Cp+p6jv3CouTc
         29+0y7Qa7/qoPRzQYX1GTfiIu5zbfVrLldBe1OvM0RJCzK+fteJf6EAeWz0+6n38Vo9L
         79wVgpInJM1iT5lj1iZ6xLHOyRxLShUoGF39CedT2uDUqL5d8f2yIPEndFOk6PvFQZrV
         G5Ry87DCGUU5/7aYTrWHo7oAS9dPmPL8e86GrKgNZuwp3hRVrWqEpmTAS/hZXGM8U1B7
         7Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343778; x=1795948578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lnyrvg2AxLIGfrYkGZJCyPnrsYHo+Bp6WoUstIMnvA=;
        b=ydQLjgImrgybjk6ovyoHfYRAmklsF1IBK1Ysg6sy3K2kBbzPHj5DF3soIimi29qRS4
         6YSxrqxzm+Gm5FY9+NALrV///N0gWjRBJDN6CysOb1hRqZp8UUJToaQQM8B3E+a+jpSm
         JtY1AfUABtZpyzz/E6Fraj8OjYU9kNwX3vXafyp47Mx6UZ7gIFFZ7uSuMMJkuC4K2kek
         GFOsPArlhQRGp7fdldTv00zjRAPKAW2L7sLGPfwDREjlAKJIKNS6VEGy/uPglFbhVcCI
         77wt3utQu71bHejrgjmkZ9e7KcvLboyJNrmr5wuic69IMNXr4SCHTxP1Zd11M5Cap2bG
         i7PQ==
X-Forwarded-Encrypted: i=1; AL+hErEdzBYllKfgiyESs3HGaxiMpPJgVuv/T5S3EMzNsx4QN2oavVw3cEBEc7uHpjeA5X/IqYN04WiC1M80tFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZdIn6WEz2sfKJvN2qVNgk6GsNe0KxSF3RDLPZd7DReRPdXvlZ
	v1027CDdrD2QsJA6XsQC4jIPig6xUaBZna7nRmgMNNuMTBYjY11Fh94d
X-Gm-Gg: AZFdTZfyPhdttx9cgu2EGBDrsdUKpO1HDKlBpA4cu5G90P+Ineqms7xNdvsPr2L0Odm
	Rh4UMhj4OUY2kj26g49PrZB4GSiUa8LqbX5oZEhuBhRLBznAjpuJX87sU2ormmXa3qgy3HEwB+m
	o1Wpxxp2+odo36sbbW1fIQWZ5aYvtA288MsvPybHForCu0gN0I8gcJp2gFYWzcZ2XIX9/Ppr2cW
	KWhmUlaYO3tE5HB7CkwzoVRzmfreSYNYZtRsISUInW8MyNsSjRr1WQIDimrmHNRAzXfNXvNuNGY
	3rC3GfKd2r3YVPdrGkQ00CVJGpFsn5ATMvKOXhCHTwZCVRpluol124JGSyvgN0O4sjtYfJfrY3u
	S2kqMSQZ3ZRoJZ1rwlgsIkV5RMaAb/UIuc1ntM3e/BWIQQ9uwknBLHVHVrgYMf8t3QaY5EfHeFa
	QzR7Flw3JKeWgWT9kButUsfrD5CpTukkGh+R+kmP7RwVpaInvP2mLuc2JvsY72oHzLHuqgJ4FsN
	LCC8rL708bSgp9JD9r6HijlWtiKE+oVcUbryht18txBllU2+7DedKHLV/i5S7PmRg77aETtHuWG
	eD+DT4VrTYEAPtSdWn2Hhh+k7/hwI1/Dm1LBAxI8MF7u3M8hJJz9VsBcaHQE2cBevhVuog4YmKH
	gseSJjqwSX6HT05lHusy59WhpIL4MJH+2cFa89HTZ6/w=
X-Received: by 2002:a05:7301:2222:b0:384:2662:a7fe with SMTP id 5a478bee46e88-3856c9a1180mr7697616eec.1.1795343777651;
        Sun, 22 Nov 2026 02:36:17 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm26176803eec.9.2026.11.22.02.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:36:17 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/2] ALSA: seq: ump: Convert MIDI 2.0 RPN and NRPN for MIDI 1.0 clients
Date: Sun, 22 Nov 2026 19:36:09 +0900
Message-ID: <20261122103611.3264343-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

A UMP MIDI 1.0 client gets nothing when a UMP MIDI 2.0 client sends an
RPN or NRPN. Patch 1 converts them to CCs the way the core converter
does, and patch 2 adds a test.

A related question. In the other direction, CC 101, 100, 6 and 38 from
a UMP MIDI 1.0 client reach a MIDI 2.0 client as four MIDI 2.0 CC
messages. The same CCs from a legacy client are combined into one RPN
message by cc_ev_to_ump_midi2(). Should cvt_ump_midi1_to_midi2() do
that too? I can send it if you want it.

Tested in QEMU (x86_64) on sound/for-next 1afd6b7547b2. seq-ump-test
passes 28 of 29 without patch 1, where the new test gets no packets,
and 29 of 29 with it.

Prepared with Claude Code (Claude Opus 5.5).

HyeongJun An (2):
  ALSA: seq: ump: Don't drop MIDI 2.0 RPN and NRPN for MIDI 1.0 clients
  selftests/alsa: Test the sequencer UMP MIDI 2.0 RPN conversion

 sound/core/seq/seq_ump_convert.c            | 36 +++++++++++++++++++++
 tools/testing/selftests/alsa/seq-ump-test.c | 20 ++++++++++++
 2 files changed, 56 insertions(+)

-- 
2.43.0

