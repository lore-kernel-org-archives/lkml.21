Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225893;
	b=NWVkbj8b9Bqk2zluPbUMmANL99fpLHVdWUe13c2AaQmXF+lIxxkeY01iUqA86P66FAcM
	 2bHy+iB4S5okRls56fuQGTyqlRz6VFMP+PTbZ99z5AEYRTaIE3VadI8TvsQ3XBxz5wmSH
	 lkoNUYsVsRYzICW5vOD5GpdU4VQObn3u4d8FzFXOqZV/3mVrsKf66iPX5uPcslm9wbVGK
	 dHKlWQFR1ASNOcle15U8Wk3kuMOhXjUdFYFMxS/8J28dYO5DTcZK+RtnJ+SQYKMGi+nzI
	 0CLiRAtJMu9xH92gVcpKNIKK0tEiNKgpBB123aWnF7yV9n37HZ0Nwe5wV3LAX3z53EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZhsI3lhwD+t6nMHv4Tk5Gvew3vT8WrKD/K7/YEVJPaw=;
	b=SHA5dlHHS/lpCOhFobYmIqxDhfWNj83Hd1W1ZTPi2WiyrucHlRmggwj6BxNKJbx+KHGk
	 Pj+bbD7wTnANuhlQ7daDA0mBQyS9ayKhoQcAGchXirbMWwp+TXOCYNNma1k8UrAPcWfFG
	 X/3YWpixocIYwEVZA8lE9pn45JTslEK1p2xBiQJ3DIcD2vMkwQZ8rSChN92wWBtVywbkz
	 M9f+q6SPzwMHLqN7j9I6TmZHVY3xM0xV4rVPEJdNPFybvDZjsF4x5ZbwODJUdCpyCzdho
	 ULd+MligXRGTdhLQSeA0zU6de1o22HNYeTuDIgpVlC6GC5zguVYAe7LefxY1zjSPgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=GriKDtLc;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5472606A6B4
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5472606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=GriKDtLc
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so15095805e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795225891; x=1795830691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhsI3lhwD+t6nMHv4Tk5Gvew3vT8WrKD/K7/YEVJPaw=;
        b=GriKDtLcKMPkRF/s4LcGU+eYEMs7fQYr22/aNjOx4fsc6pWNjyZ3GImkVKDKtSL7x6
         zWDh5CHOzoo9TAfFQy7nb5hkSoqJ2bSL/qgWuP1EqmHCp77whYR9V+NmP37krlDqJP7Q
         76m+Y6tk9gUFlnCl4fqfhcxRIkZ7lkTlS7pexjcffvLFP3VaK+a6KWh+HXC7Bew+ngRI
         AzM9p67nKW+D7oQzpkx4i2gH4GrKTlB3KwrxBtxxuxA9WGpCLyqmmOHSrz2NhfhzxwHP
         d6tFLfUX+a4OQM9Kj3StAxUJzqL7NWKBWUdJll9GB+CWWnC9SC4xcMCeEd2PJe9Xq7rr
         uKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795225891; x=1795830691;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhsI3lhwD+t6nMHv4Tk5Gvew3vT8WrKD/K7/YEVJPaw=;
        b=l6R7BgThGg8rZnEBKlsjfNH50kXNxPxD4roEUNbV0NE1eYhx0bndR5Ut5zQWMru+Mm
         gjeuskqkIgpP5bcsj4EFBPY3AgZkqR1+NZOJft96HmWriJ2NDy5nNqwaMnXod52AFbp8
         WMRhu5Ckfdi6Ak7PxwJJySCNvPEYcB5c0tM6m92hD+0xdndVxgCc7IS4vW8I59XCkMpU
         uvXenv0hZ/f8jBt+tKRlYqnFCl2MSyWL+svb1mv3PtBk6cpPkAhJE0wTeWT/Fl0mtCIt
         6UpjYFYa6wcXSRpaVV+hNMSGN6mrmwDnQT8noFZRVMsj1GTzi7H8purA8zgm12QfNaHn
         sZ8Q==
X-Forwarded-Encrypted: i=1; AL+hErEMls4aavJX0KErIWJ1mSbwrOUtlFRK/V41I7CxTMb3dlZh+8OVLr33nS/VY9QqfGM07ZPN9sa5orN7ilY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f1Ff5OoXkYjbTVHIXl2l2J4w5GKvKpgsvYsW9s4DQloE0p+XE
	msr9A55jQF17wk+3jSflA8IgDSWTuQsKfMLRlS4TCjhRwunfiJrA/jE=
X-Gm-Gg: AYBFou23Fet6eQ6Ih7yw6gcCb1/L7pq7S+WDT/nPu9mdt9yKo3Eefe3+NjA+dtOvb7p
	wmPowVH/rFBjPoJW5Jzjbk10vzLDJMCH2cL6F5DAriyM+6NFa02cSIoku1HGHwJAcXASen9iCUE
	lLiASIZbqYwkksWSlbbY6GRD4ALuNQ5C3/NPJIph6lt8ApzRhjdcr2ZKE1i1aAza8SxjEnnuuP6
	0oQ2kEqYmrCFbBDgmZ2nsMwxauvI0sHCQFHmkzbiydaK/WIsDlr3IcEePieJ9ZsCSHXEP16jZWD
	WeS3qFArTeBjz2p6vRJON2xzwGzdycUDTgaQuaiZv14cFa/2fghjaHJGM0Jg2oLKh0DQ/MoV0y2
	Xclsu5FofrlQazxThKjZrEs2phUoHw7rcjI/gDjRa1+2bA7fPzWSWTTZhpRsGNBNHgNIU2c9o/5
	QfXQBIvWWOXNpGlFfhUi9iqyZDfWegIUGVLHgcwmCv0lmvZPoct9G1cPmoo0DOsjBhXiyGqIeMW
	PeT8fuMA88K3okPv/SC7z2p4wWRCmJvbhFbNOpdEUwrQcqx2mCBoCharRsJmxtRQ+BuLhjMfa3Q
	dznJEUKHYhXOE+z5QK+gZrv9Vm/XoGpBt2wA9Ktv+6B6nZnJ7TKs+yXIZO/VsZxWOG7w62fvt5h
	wpYU=
X-Received: by 2002:a05:600c:a51:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb88828173mr107576685e9.33.1795225890849;
        Fri, 20 Nov 2026 17:51:30 -0800 (PST)
Received: from [192.168.1.3] (p5b2b4923.dip0.t-ipconnect.de. [91.43.73.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm150309475e9.6.2026.11.20.17.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 17:51:30 -0800 (PST)
Message-ID: <4f3c5405-fde4-43af-9624-6a28041e673c@googlemail.com>
Date: Sat, 21 Nov 2026 02:51:29 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.1 0000/2812] 6.1.193-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261120055200.707545519@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261120055200.707545519@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.11.2026 um 06:57 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.1.193 release.
> There are 2812 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
