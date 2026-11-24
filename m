Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539053;
	b=1pRRTRebuhI56+6wG87gZg5sKAtFUXvKwhFpx5pN9wHBcnp+2JxkhHt32UzNoP/x6X+7
	 ZWYRGaEYVa5ZLYleBBFgGj/6W3DIrJEqQofvf5ZLCUxkibJTsnhueQ7KwzW5OPxsKg+Na
	 JcC1fXSTJb7qWfQpJQKmQjYanQIkU6EaRQkYXGMQRir9aOn0R1UMet05Xz/0O6gxQ5nEp
	 t55lmo+5rbljfbQC2QcAWjZ9pU2Sky6AH/S8sbQpgo0BxpUtChCPrpiFDPk8LzAd5ni38
	 98O8vH6zYfg3PFiUPRRdPe3HZhXBe9Fv5ps9hZU3MxCPcMQljLWRBJItSj5keooaJxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539053;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0Q8le7JCIH1nVel4q1Ymz1tyMuypwKlLVFbgcHn8i0g=;
	b=zBJPQe2e9hDQHzsbzjURJOlloHV0mbPpx8t1CIrsmMiGlLxje9H/ytZBChwTv43NxHoP
	 p2/AdjDsnAVN7W5NIzyHQYT0weAkugWne7RomVJo3iEWfyhRjGOTaZeZClKIDRLHH6HU+
	 5AetbxOJTgxXxDiQPmOugjhKEeolArVIcP8t4ByCQWChSb8mYKvDKz99QLeDCQ3ucttbp
	 Jy6LtNDkUObPf5vaebe1pv5gmDYLP6i8yJ4ZtkieDRqGCaQicNzz+kFI/kEhbdMVbPqAZ
	 IDB+dYzRMxJ4Wp2mj9bTncpIOG6BE+J94h48Up5FUadUE/FikqQKQWPgSkBa69QuDCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XSSgmq7g;
	arc=none smtp.remote-ip=91.218.175.87
Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA9E606A6B9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA9E606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XSSgmq7g
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vlAs76nHe0/RUzO2eFNrqaPRcU8npdl3yRtxXdo9tVo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795539048; v=1; x=1796143848;
 b=XSSgmq7gKvOaxNbz1JL7yKxvpyZB+uUCZQku+LCZMxcCGXpU40xvWpuBj4RWh5Rneno54YqD
 xJh7y6VLdkIxeiJp+y55XCOvvJe5g2ZeVPWTKfx125S465BCazaxSnGYsCE+tsZDpcp3iDO0Vuc
 KfBxIjAADZkt8pgCU9RtFgkQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 167709dda1e004e0;
	Tue, 24 Nov 2026 16:50:47 +0000
X-Mizu-Trace-ID: 167709dda1e004e0
X-Migadu-Flow: FLOW_OUT
Message-ID: <44756a36-bda7-4a3e-b3f3-67c2aa9b8883@linux.dev>
Date: Tue, 24 Nov 2026 17:49:21 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] ASoC: SOF: Intel: Add IRQ chip to distribute the
 SoundWire IRQ
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org,
 broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, kai.vehmanen@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
 <20261124161001.702882-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261124161001.702882-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 17:09, Charles Keepax wrote:
> Add an IRQ chip into the HDA code that can be used to trigger the
> SoundWire IRQ for each link. Currently, only the SoundWire IRQ
> is moved over to this IRQ chip, although in time the other IRQ
> functions could be too.
> 
> This will allow refactoring such that the individual links each
> request and free their IRQs locally, rather than having to rely
> on looping over a list of links which is tricky to maintain while
> destroying the devices.

Well, there's no such thing as a per-link SoundWire IRQ...

The hardware is built in such a way that once a global interrupt is
received at the HDAudio controller level, the handler has to check if
this was an IPC, HDA, SoundWire interrupt - in that order. And in the
latter case there's no other way than iterating over each link.

Using an abstraction to make each interrupt source 'self-contained'
would be fine and probably make the code cleaner, but then why stop at
SoundWire? I'd err on the side of 'go big or go home'...

At any rate this would be a significant change on both SOF/HDA and
SoundWire sides that should be handled as a well-tested prerequisite to
the series to allow for communication with the device during remove - it
doesn't seem right as a patch casually added in a v4...
