Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362853;
	b=ufcakWruPoREomEc++eONuFodUq4uW0u2Az+xc+6uDGLP4U7FaFAeSanJdXbZehWGCy4
	 G0+sZdpYOkd4N2wzMiO23nCC+OzTwacg2pcEdUZK6w7z+7pFz8raY8bgl5Ig1wtvFsHAs
	 n6+bSmH1kRoVRa2e+7sWmbY8lsIH+Thp3kmnHvRmXblEE6yCzGsN4p7QAkFMcMsN2DF33
	 uARkQtZZu3V1X3Rl4XK3tAcDDM6fc8IPDAzFX5yT2ATrWHiQhSreJZ5BzL00V/W3NX4+M
	 lq9WA9cF8jTUcXgl676HVcqrQy33n8efTHenHUzR1JJnLv5eT72D9xqRYTBJE+8W7ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=oAH/5Ektz81ojOZdHN4K4NLybO43vkB7oJL3F3Dgs+c=;
	b=4Kpb4qbGAuiv3HzboCDVQ7AwA+UtmBAfP6wZTRZZGyWwJiEJ8nqQ52ijCElc8y3Mt/Lc
	 NPc7ZhFxHwpZTOPyJx3A0WpO2kQ53tgNNhA9AkDVrSMjzg5MPD7H81trAVO8HH4jcQUi/
	 Wv3q7DmNKBrT9uIcesnlDQ5/LX8J88OWFNxx0fIL0BATyR8AFW/qgLda6CAsTty3afWNw
	 oE9XoTTn56QUrfaEawztYRWBKicbQYKGcqZUeV2XjBYUvGwC75CquU6iHGINcPWCgUmJj
	 CGiq+4DZkoJyTI7YPMvH0BpeXQYvY8z9T8zcEr2sgkyXrnoCmlw4lhsQNQJ6kBsvLAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=LFzAgprE;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08369606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08369606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=LFzAgprE
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1089935f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1795362850; x=1795967650; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oAH/5Ektz81ojOZdHN4K4NLybO43vkB7oJL3F3Dgs+c=;
        b=LFzAgprEXvV7qN0PQPj7ld69lD/xcWYp4wpu3Y9tNDc7EmwuE8oE382/mwCFKL3Acx
         3ZNQ5KrRc20+JObyi2/7Ryuo3LdqqQCS1DrXMwy/VU82dQiablkt7wUoQyV2lDwtDG8q
         kxWJaq0a8ZrO3HepNPwmBJePlMvULyld6DxFAE7lxr4O8YmM/XkH95Yll53iRIaD9/kn
         ASd9WBeqet6CwARCTt9ChvSNv/T/7iapK6Fy/EMLRj/OTiaso+GsZZ0S0i05GJHflgkB
         vVLjtuXq3L7G74hIDXCxjEK/zrldn9noodIgVxstZMEwI9jUEohc3nCOiCTQDwyatjgx
         liuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362850; x=1795967650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oAH/5Ektz81ojOZdHN4K4NLybO43vkB7oJL3F3Dgs+c=;
        b=HStOVLX3cqa9DktiswCQjq11voC66jWj6JGXMeTTI2cVWoSxqV6K5SbApuvuE43ixy
         FT182kUPZX1MCAu/wJH+hmkC0rFK9PmRhtLxqkFGqGL84G/qPBQkMz3EuQuqoYk5LVsx
         dj8C3rH8xl4N84nNpFRdr4lEvykGRShxQczhqjssK3+Bx5ROOHMW+itscvUMLk5mX+ff
         2iT4fpAm28zuqMOOpo6XDhwBp+6iYBQLBi1h4dHOZJHtWPtzI/Y/UlsrlTKhcdk1IQt+
         TNfEVB/p4lrCfngweLd1k0i0A5wfxB1U0Ef++tB2KXRk+3c1umwnwgUSne5B1ViRhAgg
         B4dw==
X-Forwarded-Encrypted: i=1; AL+hErEf1VSAhfzt87TodUm5FEt4edfMAqAZJqw7PQtz1c4Ngj8XHGJfCI+Lr4/0e41d6TymowgDQuPXgQc/qmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4SaM4l9WlJNfWW9+k9kft4qh6ayNhqDbLQC0Wi3CMdnjj7G4v
	3gorle7QHXp/3Aps7SFM/p/xEiBNsmUGYmLfJswd1bqN7bgtOeOTzPSA3Wq9C35Cv40=
X-Gm-Gg: AZFdTZfQElrNez2lz5FUoGz+CwIMT98iucXjB427NZPqMHER+f9uwQsb+yy60nqXFaV
	dSgxig0Lm0u6XoMMioW91WpxsZXZwO76Rmk6KXhG5q53w58cCFRlsh+gCrTJu3106FZD6nvC12u
	I08rmSrvT1oWs8sP1A7kZCg0X+1X7pIlVLIDI8LpF01X05hJhT1GifTOcm53+L+EMgHiVQqvV/y
	hSM4CGRCRmIGN9MxMWwZC8NBO6p6zFcKHlCT0vSxpyk19+FaS3Ezb8UuNxaSTrByRO1ZfD2nwQP
	286O2ncOZ3aNslz5dFVPCFkyBLPzba+L3Dhqyy9SALhryFuxXE0JeS08lwePv1wEpQQwCyfybfT
	BoIs8yI9sRmFv50QHtABb806MzpqQKRMue+5CjKEsqWHNRak1TtLzyqzYoncQheF8dJeYA1DHaf
	kVGnAnsL1or55BzjbyDScDec31+rh8Zj1EbyUhuLNIsG+8/zFwcYYPbGZ4Ju4k/PTgEitkRrzQE
	8eJxe4zXJLM0X1tkfO/BAHqeiiWAv2EVvNX1tZqACi26Sr4HIEqXEUTkwrXLjxhLRUf4aDGGfcL
	YGtXmvGXlzAUfKRU+b9za8yqzu6ZClw5P40p5A==
X-Received: by 2002:a5d:64c9:0:b0:4a7:69c3:94d5 with SMTP id ffacd0b85a97d-4abb0e469cfmr16973589f8f.28.1795362850015;
        Sun, 22 Nov 2026 07:54:10 -0800 (PST)
Received: from localhost ([128.77.52.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm18394509f8f.11.2026.11.22.07.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:54:09 -0800 (PST)
Date: Sun, 22 Nov 2026 16:54:05 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Ivan Vecera <ivecera@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Min Li <min.li@microchip.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	Grzegorz Nitka <grzegorz.nitka@intel.com>, Karol Kolacinski <karol.kolacinski@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
Message-ID: <awMP9Gj3Xhia0ZeI@FV6GYCPJ69>
References: <20261111164021.273409-1-ivecera@redhat.com>
 <20261116181612.107a4b57@kernel.org>
 <fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
 <20261118174424.32e9f130@kernel.org>
 <dd1d61d7-7bef-4a02-8518-e17d2f50369f@redhat.com>
 <20261119133851.3f25074c@kernel.org>
 <bdfa88fe-13bb-4050-b750-962586b1d846@redhat.com>
 <ff8b63b7-b943-444a-bd37-b6fb493b5d9f@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff8b63b7-b943-444a-bd37-b6fb493b5d9f@linux.dev>

Fri, Nov 20, 2026 at 09:00:27PM +0100, vadim.fedorenko@linux.dev wrote:
>On 20/11/2026 07:39, Ivan Vecera wrote:
>> On 11/19/26 22:38, Jakub Kicinski wrote:
>> > Well, I'm not convinced. The relations between objects in DPLL are
>> > already quite hard to follow, and objects from one driver routinely
>> > "plug" into objects from another. The explanation of the locking
>> > rules in patch 9 does not look clean or clear. The driver facing
>> > API needs to be much more "dummy-proof".
>> 
>> Fair enough. The complicated part of the rules comes exactly from
>> that: a pin registered by another driver, like the zl3073x pins that
>> ice registers with its TXC DPLL or uses as parents of its RCLK pins.
>> A message about such a pin runs callbacks of both drivers. I have
>> prototypes of the first four ways below to lock this, each with KUnit
>> tests, and would like your opinion before going further.
>> 
>> In all of them a domain is the set of objects created with the same
>> module and clock_id, dpll_lock becomes an rwsem for the topology and
>> lifetime, and a mutex per domain serializes the callbacks.
>> 
>> A) Pin's domain (this series)
>> 
>>     Callbacks of a pin run under the domain of the pin, whichever
>>     driver registered them.
>> 
>>     Pros:
>>     * one domain lock at a time, so no lock order
>>     * a request or a message about a pin is atomic
>>     Cons:
>>     * the callbacks of a foreign pin are serialized with the driver
>>       that created the pin, not with the other callbacks of the driver
>>       that registered it, so that driver has to protect the shared
>>       state itself, and lockdep cannot check it
>>     * restrictions for measured_freq_get, reference sync pairs and the
>>       private data of a parent pin, which patch 9 has to explain
>> 
>> B) Registrant's domain, deferred notifications
>> 
>>     Each callback runs under the domain of the driver that registered
>>     it. A message about a pin takes the domain locks one after another,
>>     and notifications from callbacks are queued and sent once the
>>     domain lock is dropped.
>> 
>>     Pros:
>>     * callbacks registered by one driver instance are always
>>       serialized with each other
>>     * one domain lock at a time, so no lock order
>>     Cons:
>>     * a request or a message about a pin registered across domains is
>>       not atomic
>>     * the most complex core: a notification queue per domain, a lock
>>       per object to keep its messages in order, and pin setters split
>>       into validation and apply parts
>> 
>> C) Registrant's domain nested under the pin's domain
>> 
>>     Pros:
>>     * callbacks registered by one driver instance are serialized with
>>       each other and with the driver that created the pin
>>     * a request or a message about a pin is atomic
>>     Cons:
>>     * the lock order comes from the topology, so a pin of A registered
>>       with a DPLL of B together with a pin of B registered with a DPLL
>>       of A deadlocks, and lockdep sees it only with a lockdep class per
>>       domain
>>     * a stuck foreign registrant stops the domain of the pin
>> 
>> D) Merged domains (your suggestion)
>> 
>>     Registering a pin with a DPLL or a parent pin of another domain
>>     merges both domains. They are not split again.
>> 
>>     Pros:
>>     * the rules for drivers stay as they are with the global lock
>>       today, and lockdep checks them; the only new one is that state
>>       shared between chips not connected by a pin needs a driver lock
>>     * a request or a message is atomic
>>     Cons:
>>     * only hardware not connected by pins runs in parallel; on the
>>       GNR-D system the zl3073x and all ice PFs end up in one domain
>>     * a callback that waits for the hardware, like the planned resync
>>       for up to 1 s, or for firmware still stalls all DPLL devices in
>>       the merged domain
>> 
>> E) Global dpll_lock, slow callbacks asynchronous
>> 
>>     Pros:
>>     * no change in the core
>>     Cons:
>>     * the resync problems from my previous mail, and a callback that
>>       waits for firmware still stalls all DPLL devices in the system
>> 
>> I wrote before that stretching the domains would not improve
>> anything on that system. That holds for the ToD stall I measured,
>> but the zl3073x does not need to hold its channel lock across the
>> edge waits. Without that, the remaining waits are the planned resync
>> and output state callbacks, and with D they stall only the devices
>> wired to that chip, which depend on it anyway.
>> 
>> So I lean towards D, as it gives drivers nothing new to get right.
>> Would that address your concern, or do you see a better way?
>> 
>> It would be good to hear from the other DPLL maintainers as well.
>> Jiri, Vadim, Arkadiusz, what do you think?
>
>I totally agree with Jakub. Current implementation of DPLL subsystem is
>over complicated, and all these complications came just to completely
>model what was designed for Intel NICs, basically ice driver. But now we
>are again back to the discussion how to complicate things further just
>to fit what was implemented in the new generation of the same hardware.
>
>Maybe it's time to step back and think if we really need all this, or
>find simpler way to express/model things?

Agreed.

