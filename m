Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080899;
	b=OXzEvkKPRrcdf278fH/HT34Vz6H0QRikXYOVTAFsuSSdBFZtp8wyqADGrZ8PiLpDSK7U
	 Yj3XjHV/2tbJn1/UQL0u//EnpgS41Z92we9BrMUMkguknAwlM3+illLbK0qAj7oLPaGpR
	 prlWLqVClU3Lrr6D5vjIT/KYoVj3Blc6TXkE6sADSdc43duAzOMTi77cSDlRRqpjWHZmY
	 NDSqrHZTMZFWGnioNvJqLuXefEAjHX/ud5Q0ofEyqZ6XiMnYt18BtPJSnyR4yxdNoLGse
	 Z34IHGWHEEH694rty6DqATJCrzpZWxDRUWaRt6ICyU3MMiE3r///20okuFmmdTeBYnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=BfuQOTrbBgGM1H6IV66t9dZSuCArSgWVXq1IwDlbWkM=;
	b=oaZrYWDB+adNbvNtlldgYSdtCD+sItvFpRXMau6u/QosusBD0zqd+4aDCxWoXxu7E3Bn
	 1re3YjaArUbjZ/yFmlOny8knFRL+jOJIb1W/Tevggv1IePZs6sjrkBbxTt5wsQua+Xr1w
	 srXgittHKqXFjCdTCDME/S4l6L1IHxkzvVXalBdokRJB2VLAr8SpdU7k2FcImPdpiXosk
	 /vk4dDZOCssv72LeP8vdcG28C5fkNpSnopar/8xowUxZg8mPzJa/PETGymPvYUcSAkpL/
	 6GEU+OJHM/BLuwgbaI2hPa8BHA3rX3bsIecf5k2gVQArsM/fvS0LIx3CWcYhHi831ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mqxw3sXJ;
	arc=none smtp.remote-ip=74.125.228.138
Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6F760A2601
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB6F760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mqxw3sXJ
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c506defeb1eso63803766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795080897; x=1795685697; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfuQOTrbBgGM1H6IV66t9dZSuCArSgWVXq1IwDlbWkM=;
        b=Mqxw3sXJNtOeYUpyxS6zeblK2hzEmxEDcP8q5cgMGE0sn6TgRcI1x5niSLviXjCdP/
         7EpdntYjEGx/fTKehBBDY8r/JFWX+xu2VbjU/sJBDEaj09siuHE9J7i230iXP5Qy4hM5
         lH2ScX1lQV956ku9mM+rNCyQSaneTlkKTzv/Wn2YdOUqdgLq3JGGGyNCgi8E6WYphFim
         0RoZTC2Q7Vfjh+vYBmW2OFxn6zaBjZnsE5YgoKHo71iy714h5ija9aUMttjfUgbRDcME
         DzN/tgTNgSPR4d/sdf+tOa1ZEWJF5uJAmK89HxbAV4GQOlNgy9jeL9q9K8vhYFaJeKN0
         31yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080897; x=1795685697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BfuQOTrbBgGM1H6IV66t9dZSuCArSgWVXq1IwDlbWkM=;
        b=gxbUdGUxZDiXvhDbVGjZvTALeeG+SVBwN4mHf27tK99sQZZMAcTYfOU6RS1XvejZ9J
         WoVQlDHonEjbBOoPWR4BenMLY8Uf65M5DSZJLGnGs8qJBopG33hA7FPUhusFtOUhhiQp
         yOzHWzqWr+hKuFl49NAOHT6BUcZ7Lu1IhOR0zoq1tIEZnG1HS8SIuWt/KvqjwMJB+2PN
         lT05/rHH1/Qtaehff7OsZPbl37hjwwyj/m6EJ88cNwdBkqOcFedTzuAoW7zMC2t2eF+t
         8ntONn207ULZzKI/reZhDqnLrQN86WmCEKCA12TnkuSqgg/4GTC0VLEVmLFxT8elZtUz
         V1mw==
X-Forwarded-Encrypted: i=1; AL+hErEgBhn+hh/kP+6/jX+lpVGpR9+MrSQJNC0PGy/1saJMtl0gPbBYTRUajW/Za8cmEEq6oDs8TC11THfVqVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zWgSXaSRSOBCquBrZHd096c/7x4osOm+NN2D75CD7qOaZBqeU
	qFRsI3vGUeJAGGNey7BOT54DQTMMvzsGW7jjBFsJUH9ryNPGFOAw+naE
X-Gm-Gg: AYBFou3ZspMqMp5LA/i1ZrLYydls8+x9F/UtQdEh6IfHXtWJIhWyPOvGH4k1URg/RzJ
	79sHHZYXP7TocmrmvVcq8NQaRraJjzm/9e8g/ECoStfdtrpOmeMTOTVKMS3VMM/kqduembELFYC
	bVJYpHvKsZXqARjoZ4q1EaC8RUFRK0CCCLrl9AcC50Z+lQURL7i0TaOWemzSkDKtdoWSJyIx1PB
	7w+9ebNUgzlgibQZaEeyLEGybDjuL7mNHkX5l8yl5wg6UkfE6mT9QGO1oNxzv0ODXZXTh0ehukd
	SGGPs7/x1xIbSaGtjl2tBp/2UreAkmXDouEN1SRw4zL31/omcowjQjTCjfWhMi3eerm5onalkCN
	kAgAIod0nQI6P+yAldTFT6OMdNi1zWHm15bGHnPxPAvj6aB6EuAOOCZ6nWDkynwvPJNWSHhNv8o
	6iEJYTZIKy0WBn3cQc8ivsZbFkUtXp+rcZqDrdAD3TWHGiCtZszdIhe9sMPf2Isw2y9bwxLAtyg
	OJsXpBtPJw27YcaKcTmP2MRnVQh1zQGT+svOk2v6P1xjoDiybVoAey0y4THIh5yj8WKb5amUFEC
	UAYo9UEKnDEW1n/gWSsQCVBLQSLB6orocrXZ5iIpk24t3ZNFTrcKp3R/fmRcaVPav41jVuQNA3M
	XEt+1jEZK52LxcLaTHJ5ylq5PuTRPHJqPCuexkVmVnsB2PjBwbNcB9Tpa
X-Received: by 2002:a17:907:6d13:b0:c3f:7e8:235d with SMTP id a640c23a62f3a-c510dec35a4mr480605066b.5.1795080897118;
        Thu, 19 Nov 2026 01:34:57 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5122e68675sm93767366b.0.2026.11.19.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:34:56 -0800 (PST)
Date: Thu, 19 Nov 2026 10:34:54 +0100
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v4 1/2] i2c: i2c-xiic: fix clearing of bnb irq
Message-ID: <av7CvgS20rBjsJHx@thi-server.fritz.box>
References: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
 <20261118101147.3350796-2-thi.zirnstein@gmail.com>
 <av2jSyTFI1VoyGSU@zenone.zhora.eu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <av2jSyTFI1VoyGSU@zenone.zhora.eu>

On Wed, Nov 18, 2026 at 02:22:18PM +0100, Andi Shyti wrote:

Hi Andi, 

Thank you for your review and feedback

> Hi Thilo,
> 
> ...
> 
> > +	ret = read_poll_timeout_atomic(xiic_getreg8, sr,
> > +			sr & XIIC_SR_BUS_BUSY_MASK, 0, XIIC_BB_TIMEOUT_US, 0,
> > +			i2c, XIIC_SR_REG_OFFSET);
> 
> this is a bit of an overkill: you are forcing tight loops for
> 1ms. If you consider that the minimum wait is 1ns, in 1ms you
> will end up busy looping a lot of time. Please, don't set the
> delay_us to '0', but calculate a proper waiting time between
> reads.
> 

I also had doubts about whether this approach is too heavy. 
I have general concerns about the busy-waiting in atomic context
in this patches, though I noticed other I2C adapters wait 
for relatively long periods there as well. 
The tight loops in patch 2/2 are even longer.
Those waits are longer because the code waits for the entire I2C transfer 
to finish, but polling is unavoidable there since sleeping or scheduling 
deferred work is not possible in atomic context—is that right?
So this kind of builtin if doing i2c transfer in atomic context ?

I will reduce the maximum poll timeout to 4 µs, 
which matches the minimum I2C START condition hold time 
in standard mode and seems reasonable.

I will also increase delay_us. Out of curiosity, 
what is the reasoning behind the delay interval? 
I assume we want to avoid hammering shared buses
 or registers with continuous I/O reads.

> Andi

kind regards,

Thilo
