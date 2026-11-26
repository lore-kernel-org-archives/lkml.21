Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702924;
	b=KVzxCr8l3cMWBwvZ1TaVRMvIDKnimHtIwiVQtdowrXNa56cxhmg3yoX0xNyqsOugCXzt
	 0E6zY/evFhm03Htfcsra8KvNSxOangqr77akJlyfl/fYesBrXoxMzzsetGBarPUmBDJAL
	 V2ECXJEe4Up7zJ0NP+cW78sZq3iWYrQuN8YwgijBnWiT9QGe9aojkTEP2CmNvO/mYqaxE
	 XzgO+DhwqILEyG2NUCt7gQ3/yiyqJrAC33sbp9rTzKPNCXDewhDAcWmV2mOF5eb+XJ2jY
	 /mDrN2A8oz7bSRSWn9ujR0iHrndpIUeHkY6+aTuZ5wdGhRE2ubwxltMpKdQYhyIU8Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702924;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=OvVAZTz69zThPSa7hVXEpLXSovgpYtvS4X1sc02ssSE=;
	b=y0X3At7yMBlgfQGLwizWccL1LH452jCVHXq7hnQT4Oj+zqE2m2Hv+uzLJZ8ElST9oxEc
	 riktKGnmPHlLBGKGcx+0pKkXyigqAYgJTId11qqlW0JgYvny1KknsWS8RSyX8Ga1Bnwcv
	 mGPH+5XW/Y6C86mqvyIxOTp3tguTyUQL6p0U54skGWdsYQmVH+pA1ACVt8zLnrpTWYI4c
	 hlUxJdcWAHsgGwL4hbBeAWbRjPbqxmgCnsoUbZVTtOdRoeDz4Q+kWWLu8/TzihrPlXUS0
	 2XtgC2zkdht0TUZ6LgS1LyTNp9O1PhzzO22gqd+zrFHo85kpiv8odHxrOcYzWw83Cwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aoiNvRcF;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B90606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B90606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aoiNvRcF
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 464DE1A1819;
	Thu, 26 Nov 2026 14:22:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12490604ED;
	Thu, 26 Nov 2026 14:22:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E40EE11E68014;
	Thu, 26 Nov 2026 15:21:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795702917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OvVAZTz69zThPSa7hVXEpLXSovgpYtvS4X1sc02ssSE=;
	b=aoiNvRcF7GPO1yOrbbUy+hL+m8rUvoytuvmFiBT5vnJYRMObC6UfTH103FpcKeZR1yVX7k
	95I57pM030VNwcOYTIv0fXoLgoMK8CzmqBQyOrFDhqfBkDCMQxy5w9H0oGM23ITRIZ4y0e
	K9cckRyHdEX4xPC4iVInYC01liObmgSJALbXyN+HgM59fDbakqFs/NRcfKEZbmaMkYqLho
	hYz4dPbVQTsHFmMUCRGaZn5u8hFDNy6+f9PeZY5UGIBW/clPHiQ1HcZ2wnenJeTIPzMbi4
	dLSTpFpP29mZclQ0zhx6YLTpMIWMhlvpi9fWSFFO6u9ZCg/JZ2NwuF69ekBw/Q==
Message-ID: <79b852d7-13b6-4535-915f-21c992e2ae67@bootlin.com>
Date: Thu, 26 Nov 2026 15:21:50 +0100
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
Subject: Re: [PATCH v6 03/10] i2c: cgbc: Use real I2C bus names
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Lee Jones <lee@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 stable@vger.kernel.org
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-3-bb070ad3e9aa@bootlin.com>
 <awg2_PLCeNgio_bp@zenone.zhora.eu>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <awg2_PLCeNgio_bp@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/26/26 2:41 PM, Andi Shyti wrote:
> Hi Thomas,
> 
> On Tue, Nov 17, 2026 at 10:47:43AM +0100, Thomas Richard (congatec GmbH) wrote:
>> The adapter names described the expected purpose of the buses ("General
>> Purpose I2C adapter", "Power Management I2C adapter") on conga-sa7 board
>> rather than their actual names on the Board Controller.
>>
>> Rename them to the real bus names "cgbc-i2c0" and "cgbc-ddc0", matching
>> the naming used by Congatec.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 6894f640b8f3 ("i2c: Congatec Board Controller i2c bus driver")
>> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
> 
> BTW, do we really need the Fixes tag here and the Cc stable?
Not really, I can remove them.

Best Regards,
Thomas
