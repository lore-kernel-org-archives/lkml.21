Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526708;
	b=wlm1uSLycig2gGxtS4I03XEkh8sefX5sJWQ2TWclYDjj1eYMOYDOnPkfl696wYBZQDNt
	 6ZzWNbdWUTcEhaj3yQx20KLi3FQ1bRy9HaiX3gcBR2ItTlrYRJyH01Fz+wPYQsx4LjmIJ
	 G2RVEUPTiF72bQLWwiISIIqO5am+GvMg+wjPYmrHb8sqnBOz4387gF4CRh++AW8zc73HZ
	 wfceC9qN3hHofPc36tlT2r2NwavpBhJ+uDIxccTK3XIGb6ynttSE4ARYMr1jmt4Ya26oZ
	 lCXi8AxAzEO7U3gmTkvp0vPS9pPM7g9PeKsAHlSAlzoj163KJMT9eNL7pcLWgwnDcAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+RtgrQ36JHyvhHGZvGGPZkAXfWTlvQfOhrnt2cyvwVs=;
	b=TivGGy0/zhlKzecDv0FPYblik0ySTOeYzJeN7OLVVFblVNjA3bYSf+tPyIUg2fI0sDcj
	 ADEf2VNvZI0Z5ojGIBaPt/fRGMR0J+kwiJJu7WLsikrO0C+SjTFIo/JoWiV/1xlM+NdMQ
	 6JsSNB25YHLVj/3yivXN3CDtwpDE6j7PC9ydNINgLnDhZ1K5HpfxTT69DQcYPMY3KmdTC
	 mvWZeIqgH11LuG5Wv1s0irHS07wLeWLpY4VmjtQGqWFwgSJfGdNXLV1w6PHl12btrEEEg
	 o1pg/pDlZdLKxGcGG/Fe+gVlRqFXaiO0HderY1v2zhjhl3+iDFMa2gPP2j0gDOysH2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=zBRyiUY3;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCAA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCAA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=zBRyiUY3
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso913839eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795526706; x=1796131506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RtgrQ36JHyvhHGZvGGPZkAXfWTlvQfOhrnt2cyvwVs=;
        b=zBRyiUY3rhQ831i6K0Q80YRK53wy/s16sGtc8qaWE3XszoZ/667xPbc9pI/ly+th+y
         8C2crYafo+omUFFfwd0UArRoD4oPLMKu/J8MG2sDRlOrYbFMSqp0jqTqbGwPF6W1jYoK
         ZLBbBElM6smNmHeMvleKKZGm7Dwid+s++sfKwP78RBkYAGwOEB/K/tklvROiYourIZ/d
         VUIIe9gEdRb8Lds2LRmJ7KfMvlKptgGrtq76GeM+WG+WT34I8h1f6m8GrOU6umx1Fu8z
         mKBkCtSPmPAWXBoBSUHJpRUiQsSyflZInH4weSkhX4KdhUiZl+VzcdBs9Bt+CVTVyNwY
         YT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526706; x=1796131506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RtgrQ36JHyvhHGZvGGPZkAXfWTlvQfOhrnt2cyvwVs=;
        b=jH3mWHbvBwWcsbxKWZiTas37VuLtdaudB04eA6bX5OYdhR4JzdlZS9SD5E7GEHfnCO
         xIABT/bfMaif4QUO7AViaLwoNNITa2moxqyd1eaevwNUvZmjIbdfxrQS7PekC2gQzJ0H
         J+wLodlBHHAOrBldFDXc07z8hV1Snpp91+dzD0zDXfrQoIp7K5aqnc/3F93cPZ5kh3ot
         jtJUhSSfnYtwwUvyZWpELh9orQ4KR0EwFbrZDkPtKBAfMClbxc6tpMd5p4aGsjXjUFlk
         uh4Ps1Ku+5XL5L56+0c6dewpf9X2X2sTfUulJx6/QWtZYAUiWxwZNtw4Nv/sMhu23Hwl
         mgsQ==
X-Gm-Message-State: APuU4Z/O/l3znviqKLz7EVy4bmyV8gT7p2RcTCDV+ET7h5+Leb6AZm6y
	2MfGjPX4C9DCHb1lVeNbYMN7w1bPSZZL/8S8OyE8XI2tycGKszH1VFbSbnuzuzCw1Io=
X-Gm-Gg: AZFdTZeJnQSn0ApEQZKmJiPby3lvYdmveUzuB5M0pzJ1sEizf96vZo/ms7cw61oQwT3
	CleVFzpYArvXSD6tgsF/qMByIRbJDvYvLvn3pucxaQik3RDG7NB3fc1ZBi6LnJgg37BBI88AN3j
	kxobjj/xIJY8xnp9bcdDkGFTSnEpYX31xuA+A/D/joxKm+//qqMjFZ6xEaDC+uU7eM5a8GOUIDU
	jJ+MgYHcYC5BuQmSo5n/EOFbg0Zv6F7aP/ELzkutm33lEyJpyObEvci51TX2uzBVR6CW8iTGDk3
	6iIcpMx83j9iQX/3AWsJQpC3999n4Tl7JqTSGyoSIaoQzzGGujDA9wdUuRA3xJsP65xvWp17L3w
	IdhG6wezsGNLQwjIhdJJoyPD84ubayhjuXPnfVW66CdoX8z7/V3artlWucp4u+aZVJzyjptZ1aA
	19DLachNSDxH3uFK8iaF3vpPmeQcnsYU40rEZVvCNk9Z2rmCk9ZkY7Koe23tSIwlsVsoGd6PIqF
	IIj+BlcX2iS+9P6+OF5Hrmph5iGUzEzkL3M8kUOt+mdpIXumNRy41vFsTrw9GznF8RZZCFTSA6E
	Vb/gDKWCygojIET3xadkLyRYGNwE0KlO6COxfd/JboDgys64ciS2JkxpEWLaSg9Y5dr1F3CJQae
	vtQXkLhstZw1P7KepXqdVp/TJ1F3PAFF+tpf4BJkHk0veSKy02H9v7hcTduJK/FajiPSUqA==
X-Received: by 2002:a05:693c:8209:b0:383:e7af:c28d with SMTP id 5a478bee46e88-3856f14d5b2mr15436134eec.9.1795526706150;
        Tue, 24 Nov 2026 05:25:06 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm42793514eec.7.2026.11.24.05.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:25:05 -0800 (PST)
Message-ID: <f43872eb-6549-4087-a6b0-d49d877e867f@kernel.dk>
Date: Tue, 24 Nov 2026 06:25:04 -0700
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
Subject: Re: [PATCH 5.10/5.15/6.1/6.6] io_uring/io-wq: save worker type before
 dropping its reference
To: Alexander Martyniuk <alexevgmart@gmail.com>, stable@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Kyle Zeng <kylebot@openai.com>
References: <20261124103600.39642-1-alexevgmart@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261124103600.39642-1-alexevgmart@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 3:35 AM, Alexander Martyniuk wrote:
> From: Kyle Zeng <kylebot@openai.com>
> 
> commit 37e425460b7c41687e51e3254b1eb1d799da9614 upstream.

Not sure why you're sending this, it's already in stable?
-- 
Jens Axboe

