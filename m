Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545201;
	b=HsYupkHARsMDV9HHfQTaXBtOdD25piWPrDlGw4L+T73helrGVBRCSHPykdegVPuuw7nw
	 Fek7J9viElzLJBUnLz4lx479fa7QaQwLP4wPvARqah9t8WAXGDXnRvdU2XAshCkEXU7HV
	 AtBz+Ld0uS91pxYHPjMtimzMhgzTjyma7TagdlKdQrb5fdMX462Rl1P8Su8VB0lOFZZ0Y
	 FtNER/I8Rl2M7yvK7bh1S21BZxQHf0cN+hxWVDk7IYKPQLxLKkjTkNsCES+6AV8SYxy+h
	 S9SgcoAxmU6VWRgh3DarZnXh2LfusVGLeMXGFvZojzEH/FizEtB5fJWKIRwATsaHG8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545201;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=oDK7RSKP6BjRV7jQ/i8CbLe2IKb/rxRhk8FWZ5IoGsA=;
	b=jYTOJCjZLu/hZQJ2XdatQX7m6x16Laktt64gVYvHQ1QkviHHL22wBwme09PKb3JgURN2
	 1kM60+/wLDTc9Ur7k6TADrSsvpYSwkW7HiENpwa1UVsEwiw3mwREGbtylJNWicyVkbIyP
	 lSH11hKdBm2q0AFmhS5pylVznTyk3GdjYD95JH3LpM2s9V8uX2IyIKB9kWAfP17XtTfkq
	 laUBZc4O8MgC5UJ1aG7I/KX3e6TL2Vt1aeF7I3mZAkNQGRBzMEBA649Nn4LETSoXHu1x3
	 pWPhrU4d6eyFA3iEwikEHl9KSdmrJ54e9F8+8Jdkh+7mt5HWL4Qr4SJgCV1RNMdNeRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DaOtXQ3m;
	arc=none smtp.remote-ip=95.215.58.83
Received: from mta1.migadu.com (out-83.mta1.migadu.com [95.215.58.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1228606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1228606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DaOtXQ3m
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gGhsYu/y9SVE2GrB2R7HYjiv9jvGB8VN33a5tP7LE1M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795545198; v=1; x=1796149998;
 b=DaOtXQ3md6QC0WFSsFxzimiMMcYoZd7UGaOvn4wrnNGUqugL2P6F8ahu+5XrxuVBFKj6MOTO
 SkSxW+NWsj4aqzhIbCBjayKhSxjEsz5MOOoq6vZVurvQk8EYERg4ikfNzbozpoee/EVCMuGzTVN
 tSikGiBmrbQVpRoNSvkFnfEY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 101efe05cc926e0b;
	Tue, 24 Nov 2026 18:33:18 +0000
X-Mizu-Trace-ID: 101efe05cc926e0b
X-Migadu-Flow: FLOW_OUT
Message-ID: <21897535-9c63-48c3-b7a9-5816d0ca3265@linux.dev>
Date: Tue, 24 Nov 2026 19:27:05 +0100
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
Subject: Re: [PATCH v4 4/4] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org,
 broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, kai.vehmanen@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
 <20261124161001.702882-5-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261124161001.702882-5-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> @@ -511,8 +511,6 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
>  	struct sdw_bus *bus = &cdns->bus;
>  
> -	free_irq(sdw->link_res->irq, cdns);
> -
>  	/*
>  	 * Since pm_runtime is already disabled, we don't decrease
>  	 * the refcount when the clock_stop_quirk is
> @@ -521,8 +519,15 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
>  	if (!bus->prop.hw_disabled) {
>  		sdw_intel_debugfs_exit(sdw);
>  		cancel_delayed_work_sync(&cdns->attach_dwork);
> -		sdw_cdns_enable_interrupt(cdns, false);
>  	}
> +
> +	sdw_bus_slaves_delete(bus);
> +
> +	free_irq(sdw->link_res->irq, cdns);
> +
> +	if (!bus->prop.hw_disabled)
> +		sdw_cdns_enable_interrupt(cdns, false);
> +

also wondering if the two actions should be reversed. It'd seem more
intuitive to make sure the controller can't deal with interrupts before
taking the resources down.

edit: I just noticed the AI has the same comment.

>  	sdw_bus_master_delete(bus);
>  }
>  

