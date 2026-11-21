Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302553;
	b=wHX2gXdfSROXf8RKbeazBbRCbu1G+8Y/d/d+pOGGExNi4EfFwpH/5v5rX8Lcz/ZHHJPu
	 w2jauHLjz1bHW0pDQ7pswGo/qLYJ5ycXD6K1ry9sRBDczWSQKCRvBctk9uiOvSe9IcE/v
	 KcWFgcVeLOyprbjcjaCFkPo6KlMQExtICVWng0KFLYIFRgsFNi16m+sFlIXMLYwfLNJqj
	 pnlX/ZRUxbNdKrnqkEC6l3btF6RV45VhRqjwJofML84ys64gvQvVkmKWjeebcNtcZiM5V
	 +bbLjHUh2VcIgEccdxZNV/48jBYQ2/2sWJbXwf4G/HbRQUvdnxnLEbqqL9dGQOIk/gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302553;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=2CErbQZuzOV4ZJyyX1YT65TNric+LUU4CVPhMFH/I08=;
	b=yOHA/wWSo1/ljypJvdxEUdInKnSJFPdfU8hx8qet3fqcdYJx45nF0W1n55G0pJXL/yL/
	 TAkm/cE21B/tzhhc5V7Ppw75dh/Bb8zMXRxblsA6fq8QHTvBuLd6YfjSceQyZGOG8YEDT
	 l6FtQ2mFE6jognWZgZDMIL8BpgtXkxNP9KO5utaaMtqyDzojIjKIQYOkmjOnW0e+zPW89
	 ENcWzQJRSlzpsrgHwEALXb/OZMf6biJf8ZeJ8EOhD5H7dJZALrk6TvayII6MDlzYHBdWn
	 SMN5eSKGq5YzwAQfLKZHZjkmi5BTjckjBjOgnLyUrc+oLuS0LqgTC8iJRBigXnBB8Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ipvych.com;
	spf=pass smtp.mailfrom=ipvych.com;
	dkim=pass header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=iOaruSix;
	arc=none smtp.remote-ip=95.215.58.161
Received: from mta1.migadu.com (out-161.mta1.migadu.com [95.215.58.161])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81340606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81340606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ipvych.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipvych.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=iOaruSix
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2CErbQZuzOV4ZJyyX1YT65TNric+LUU4CVPhMFH/I08=;
 c=simple/simple; d=ipvych.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795302550; v=1; x=1795907350;
 b=iOaruSix4dK4/HM3KN0wnG24PAg1Ibsg5/1zGFjEC67s8pVbuargfJjD/j3WQfLOONthisqv
 VfRyCZXukagQxZBZEgcxL6+lPY7QZqIhiJCqumSkLJV8jjP4BvDBfjJnbbsSB4ASHVhM1+wTMJ5
 SY9nfXkRkqOQUTNfGm+pO7GEk4Em8o4NXKSQtRsKVhtY7D0mxzSEmn81Gxf/+fioPoV9lTE164/
 TQ1MIijL2MyDJQwxhfumyTJKgUPKxA8qE9LkLV5hwB3N68+hsR+ALpSDqEUorT6qvdcFlnS8O+u
 yH19SBLyWsj5KVTCO5fjZ/i7RK0ff0nrcGoq4o7iVOb+w==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c2ce4d634fcc4153;
	Sat, 21 Nov 2026 23:09:10 +0000
X-Mizu-Trace-ID: c2ce4d634fcc4153
X-Migadu-Flow: FLOW_OUT
From: Ivan Popovych <ivan@ipvych.com>
To: Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org
Cc: pali@kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control
 whitelist
In-Reply-To: <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
References: <20261121193227.9408-1-ivan@ipvych.com>
 <79f7bfaa-1cd0-4d44-818a-f080cf0168c5@gmx.de> <87v75paji6.fsf@ipvych.com>
 <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
Date: Sun, 22 Nov 2026 01:09:09 +0200
Message-ID: <87se0taiju.fsf@ipvych.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Armin Wolf <W_Armin@gmx.de> writes:

> Am 21.11.26 um 23:48 schrieb Ivan Popovych:
>
>> Armin Wolf <W_Armin@gmx.de> writes:
>>
>>> Hi,
>>>
>>> can you check if the 30a3/31a3 pair also works?
>>>
>> Hello. Tried 30a3/31a3 and it works too. I submitted 34a3/35a3 because
>> this was what is used by dell-bios-fan-control[1] tool that I use to
>> disable fan speed control right now.
>
> AFAIK 30a3/31a3 are the commands used by the official Dell software, so
> i would prefer using them.
>
> Thanks,
> Armin Wolf
>

Sent updated patch, hope that worked.

>> [1] https://github.com/TomFreudenberg/dell-bios-fan-control
>>
