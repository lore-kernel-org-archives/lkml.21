Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483066;
	b=VwuqRa1qLpWjZj9xJ4vlMX+JNkaVAOuy/kpluRGXKb0TxOXijA3uatgJlJM4EkAwgl1v
	 /7m4RCftTxOjBTpfMFYkqV6YpD/Z0SoQCGFSH+MyPcFLT8bxOECyx7AwPrMRgLpbw7bsU
	 omxCkbJpdWT7+XDwxOdBJULzy1gWtH1zkykb+kVtlhlNWASVevT4waZO4Cl5TGNlcaz/g
	 IZX6sC9fueCsiFW0pezu5RQA/eySJm95O66FX4gOl4NYWkUcT0YrSs3jniJg8n+CLfKjl
	 6avxyz2whApx0caZDwTK9VZ1hMAVwYsLWl5NzgifhxFNFv8GFCHyHC/dDS2eoz9dinw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=itmP4L3DXMSGmXVmoLrQUEVKU8nQc0azolCH6tmT1Xg=;
	b=JvWnZR67iwl2EiQS0KI6IZgykouv3+thbAM7HNoHVx9eoL3QiE3dSgBfJ7ECh4bvG20p
	 ldsMVB1swqSkjolZBOlV+L6p86oa07Si1uUK2qwwhYvZiXXDOt7hvz2S3c/G6iaxuOSP0
	 3Kc+Hi+FIjvrsZxEFrvwH04neuFJnFZKcm+kAVJB79URlzGQRgU+r6wNGNqLICJBWTRX1
	 CaeCxqI5/5xP/gPPPYnEprQxUMh7okAcraba1OHLqrXBkBJzE2xtI+4ipOzcK8lRJhnNd
	 zjXKU1wJfteAp5Agdn6XuWt3PDg8f9r0IRt9H5xGGpQUtS/+pESh0COQ907FyXrLBcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i01IyUkS;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8076A606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8076A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i01IyUkS
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385d8a00598so5564677eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483065; x=1796087865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itmP4L3DXMSGmXVmoLrQUEVKU8nQc0azolCH6tmT1Xg=;
        b=i01IyUkS0KDuGi4r0vPByL9Ph/bF+DMoLWNnGC5wDRiYFVB5FX+8LgDdJPGreC/onL
         GDTZvEtWSXzH9ZWWEGZVQwtuF0FBC8bBMoK2yBz4Wjbc/goC9bv1lq+ijZHB7M6dDyAM
         Rcuou1wycq3mqkzRV2/+hnCpFTpwUnm6EvVKW4h8IUtWyxYlPS7woChKvYYRu+/+ZZno
         btkvuAdDEdYbzNFS8Rn0aucLfJiHyLAjBKaiNJpga9ctbDtYN4CALtEC7Ju8mSVpt9m5
         bvaVQ/i/iiqWwpVU0EXroxtQ/Z3laiFt0iHeNXQNNjiXOnCH7WILCQKbqlrMLlNCKOWl
         a8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483065; x=1796087865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=itmP4L3DXMSGmXVmoLrQUEVKU8nQc0azolCH6tmT1Xg=;
        b=eNv0JVc7DoSV2Rw5FT50oyuzH9jGw4HlLetC4ue8N8bWYia9ghlZ3CizkJogNveo2j
         2c8TrFPJv1Ka1OXQdDdTuLlutqEdEt6IgQl5V5iUagvyZGvYJhLHjhLd8f0n80p+1nRK
         Nd1fK0nJrLuq7sXLP0+1L9obH1ATDDmTjE4NS2DgTg43qW3SdjwFPdr2FtIr6lxRJXWu
         U/vuo/jJqG2VG9Vy0nJ8tDJi2D5YzQIdoVTOX4FWkZPZNGriKc5ntLTiZ42VzXg3YWHZ
         mGImNq5GVK8iLFK7R9sZ4MyczPLJtJwaRwOXMC2604XcpP0VrsHXRi7SQEQSflc4hSyO
         JNkA==
X-Forwarded-Encrypted: i=1; AL+hErHOyqsV47TwG4ivHH8UFqHuh9/TP9z1PYPhRRgVEPI4SnJVzV4tK61D8IpdVQjxGV1EXkUgN+YAmqC1mWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sBLdAs8CadFxYPxxgUHhC/EuMDVOx9oz5FQQb/vFIGsVilez+
	97ix8f0ZcSbcZu/t7zEYtysyGZ2Vrg2PQ6sbdaKhmG+l4EuNAEfv+qSuSwvP/oqf
X-Gm-Gg: AZFdTZejN8sahSdPe/toTiYkvt7K+6Txef+Iqi0Fun1C43LznjYMg5B/5A6G8e/Ob0x
	HuUCSTJfRvg1q3BFoMXH5WltC4wljgfA7psNOQjz68jkMnMe01ETqq7AcggquHy++m+Qn8IhH1a
	KMC2JvWxrHlRJAiWEUrpziiojOUMdtEPg7dFrRoSdxABIridMSeRhKM3VBzhmUbd020/wWDUuEy
	h0A36qx+cyfLWnFH0Rz+HdDL7kN33LwYzqq8kwckGISNnu8nZf+8+XlQYsqodjgvNvnFZbNwapa
	sPRSc8ZdhcTjy1f2392mXjlgHBypac0WsTPpWDAKf1WcEsZ17su+Zi3HzuBQVWJSh1VmXyn9J8V
	IL6LIXI0JzbLLc5q0B3rKC5JgXCd+vCLbHD9ZPtdghZAIeTqXkxF7pAqN5094orLu/lduvfSjdv
	TCvLnUK3YHfBznXyRi+Yem78o3gjvtximizp2jaPO8yTgbcL87TudvFtJSsNpI1G9Bax/LcBY/8
	jSfUyonvYgfrbJYY9F9hT/aCcfTjibjsJHhOEHynbU3B+/S7sHTF9mCYK22dVsaTe/iRekZcA3j
	X8eT3QVjzdM3vt/gJ1TFEelXp4oBDbjnwy7L6VDPt2dHeW7cWcwXMdr3wWIp7v7MeXs9TQKZLpa
	ysooKO0+5Z/w3THiwknqqh5+QeUJaus88TVa7pkqT
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr14464834eec.19.1795483064438;
        Mon, 23 Nov 2026 17:17:44 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm15112586eec.0.2026.11.23.17.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:17:43 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/10] soundwire: stream: Clean up allocated runtime resources on config failure
Date: Tue, 24 Nov 2026 10:17:38 +0900
Message-ID: <20261124011738.395295-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123075522.405347-5-lee@kernel.org>
References: <20261123075522.405347-5-lee@kernel.org>
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

Hello Lee,

I tested v3 on the same Dell Latitude 9420 as v2 (Tiger Lake, SOF IPC3,
sof_sdw with rt711-sdca, two aggregated rt1316 and rt714), on soundwire
next afd88e7ad781 with all ten patches applied. Only the soundwire-bus
and soundwire-intel modules differed between the runs. Two local changes
outside SoundWire were loaded in both runs, my SOF control range check
and a debug print in rt711-sdca.

With and without the series, all four peripherals attach, and playback
and capture work on every endpoint. 40 start/stop cycles of the
multi-link Speaker stream pass, 10 of them after the links had runtime
suspended. All links stream at the same time, and Jack Out start/stop
while Speaker is playing passes. ALSA pcm-test shows 24 pass and 0
fail. There are no SoundWire or SOF errors or warnings in the kernel
log.

These runs only take the normal stream setup path, so the port and
stream configuration failures that this patch handles were not hit.

Tested-by: HyeongJun An <sammiee5311@gmail.com>

I ran these with Claude Code (Claude Opus 5.5) on the laptop.

Best regards,
HyeongJun An
