Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123477;
	b=Z4FP9HgxKM/L+jSaZLBwrmB+DGQ6NkdziDa/2FvOU0jzRvRj5FRJVJ9Co03EAH8MN9iV
	 iEQ3DCXa8yWCoPUaWqkNyNVy3hI3+WM1ByX/KJKr1MS44uBVvDwfFuD73Lgj/Hy0Ygv4w
	 0/uTSOywe+mVI9w2UqmYXIQBSIUChiISZ+xYoqx6UvRKzolXoBtRXXnLXahMPcCs4S6I0
	 vz6+cUL53q6WZyl+OQh3+ygY1qgUF5htVZdaYy0WiQxx1sESZY12EiLPfpD+lBU3iVtkQ
	 Fk+dPlZMhM75WaCjPTSDnOAiPDGPElIW81AzdfhB1fYFeOGeO88wjwVPsr3hECGL3Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LTu8+DHLWdBcMEbo3FpQh945AxcJKdloTy8V0XlCjV0=;
	b=Ba6hZOWkisUYGInCQt0hDFohDKJ7LmTpLuXZ+4ttY5ITr1N1R+lUPzMUlxEExqs8y/uE
	 zUzo0D6qNhg1Z9rvT6K1hC9YNov7svguMQ2ksnVLZdB5gEgBZJtYxt4NHNzFXOEgTiAaE
	 5Nku9vIkdKWj6mT3C5HMZadg+IDeGf5d8kNeH9yPkVJKE2DdTn84UKEpZ04IYa2VCCi+P
	 urSKePF1iKAesEnsFZT/97JJqN9mWMCE31U4IMKfalGHoxBfzAQ6h0j8el5bEWYI+JBIc
	 Jo9Tnr/Mul2Hiyy2cs3a2P0PpHkooT7gVmidSLNnM7j6ViGiIsawaYMzJhtfoUvFqkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alstergee.com;
	spf=pass smtp.mailfrom=alstergee.com;
	dkim=pass header.d=alstergee.com header.i=@alstergee.com header.a=rsa-sha256 header.s=google header.b=wWxcctXR;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709D1606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709D1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alstergee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alstergee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=alstergee.com header.i=@alstergee.com header.a=rsa-sha256 header.s=google header.b=wWxcctXR
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso101602a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=alstergee.com; s=google; t=1795123472; x=1795728272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTu8+DHLWdBcMEbo3FpQh945AxcJKdloTy8V0XlCjV0=;
        b=wWxcctXR17zfT5nhX1739LL1IqZhP/hU8hDDI5jox1VMXqJAh4keLJcrIXZkSnUFkI
         jnls41RwiM/xF6FppkPTcoOtIluWS8rgiGhjW9hPIqzBRGeGyN2iQiQUDPSNvSMkLV8R
         o/XdWJY0mSM3qC/Dkp5Z3C4Q6XJYPFqyw5IAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123472; x=1795728272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTu8+DHLWdBcMEbo3FpQh945AxcJKdloTy8V0XlCjV0=;
        b=BQz4G1J/3adDzor2bocPL+dupSh3jVzbjID0HOEnTgMrJWlq8DwBqpBJ/YywK0P8XM
         xcXt6wMENlZBVgC+VRsWGJAff3tL8nh+JFNvJD49GEXXpczXRtzdpLGyFX5FFdiJUe0H
         rTFq8NgBLYc33WepClSC/ZHqrgJ7NtD8tulsTiM0MXybV7ygib908PGgauLK74fw7a8Z
         mmevYbsIMW1M8KPVanlMNLbfIgQXQsIr038kNsiOVPCdA+2RZRlqF3iPFAzpW5nDu7Fv
         4yd1aEWeru1/LP0GQRqwJXHBjJOLXzw9VUvmTt+K+cyZb32Y5KsJRvoXM10rCSd+JJsw
         tD0w==
X-Forwarded-Encrypted: i=1; AL+hErHp6dD38gtn8YFVc1qNJX08uLvuMNqfoQAXhmW5NGAw2ynHDTJHPJNCYjFj3b1W8OsI647aJxhy3LS3iMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hUyPvIDEv/ZnklX7caGe/DXbvDP6roXJh8tHYWF6eP/rGrfUs
	KrioZIrohBF4zw2/0qZYZZVJatrTANDw5Hn5iLAI5kWo2jhKXa2YCyrb28EvcyxSQw==
X-Gm-Gg: AZFdTZfrv1/3yjv7CX+JymxLcUte3LW7siCHnwVrtD7jdrAG/Ofx3WscFQGqha012cN
	GEXaLZN6PXX83BYJZOr3iJ3ErF3MQm09mE57UvP0fu2QxVR1ec6xqpEl+hcv5Xpsvjb2CkpqNK3
	EfiDa9G26rGYYHoef8LFw9ee6OAH1Nnvb+ypmpMhM76ZtBfZs9cE31H1HqwdLsgNHmb8XiNk2Nh
	fx4AOaMfVnPx+Z8CnDUG/jn+XBLlw4g9w6Y/hkSHXBjWbLvWzcav5N5JDhkRXFtQL9OBIFUmxtc
	0DD7kkcDcGHRx7NFkiaJtYyNQ9O5unY6s/gQdfIdEHFH2vHlTrrH4UuyAokd7alrWuIFM5XYOXZ
	kSdoER1dYKInLi8h7ZA/GpFR8cZyOLyH39XkSl8Pk6iy9M1iqw6GbzbnP6AkJu9e7FhKZKQG7Gm
	zXMBvJtpwH21pfg9MvuM8i4ejs2Mzkgn06xEs6T5ufKUo7Gt4HEBHQO4W1bwB0DM+exRi+WpaqV
	hJMRHfK9h+Dje6fzhxJ8IPZkbeW1uH+6c+DR9/YBA2tY1NvfxDDw9xs0PDOsE0EcGHy49hOX9Bq
	pEwEfYIfb1gUvU3e2I9tPYIDRWzEBRyFXPc8t5d0nZpKD4CBQbBSDiYwtGLenh3By8p5xQRr4uo
	32mco+zcmce3L
X-Received: by 2002:a17:90a:ec86:b0:3b3:b0f4:1bf5 with SMTP id 98e67ed59e1d1-3b41c9cf154mr503200a91.25.1795123471595;
        Thu, 19 Nov 2026 13:24:31 -0800 (PST)
Received: from [10.144.72.140] ([172.56.203.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm3815659a91.7.2026.11.19.13.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:24:30 -0800 (PST)
Message-ID: <5ee36c74-54a2-4fc1-b4bd-61a1d8342c2e@alstergee.com>
Date: Thu, 19 Nov 2026 14:24:25 -0700
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
To: huangwei@kylinos.cn
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260902090531.2134150-1-huangwei@kylinos.cn>
 <20260902090531.2134150-1-huangwei@kylinos.cn>
Subject: Re: [PATCH v3] usb: typec: ucsi: do not register UCSI on Lenovo
 Legion Pro 7 16IAX10H
Content-Language: en-US
From: Alex <alex@alstergee.com>
In-Reply-To: <20260902090531.2134150-1-huangwei@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei, Heikki, Greg,

I need to correct my earlier report and withdraw my Tested-by on this
patch. Please don't apply v3 as it stands.

The commit message says that with ucsi_acpi blacklisted the EC
negotiates PD on its own and charging works normally. Longer testing
shows that isn't true. With ucsi_acpi and typec_ucsi blacklisted and
confirmed not loaded, USB-C charging still drops:

- 2026-11-18: ADP0 went offline about 7.5 minutes after a cold boot,
with no suspend and no replug.
- 2026-11-19: ADP0 went offline at about 588 s uptime and came back
by itself about 5 minutes later.

When it drops, the EC itself stops seeing the adapter. ADPT (bit 7
of EC register 0xA3, which ADP0._PSR reads) clears. Unplugging and
replugging, or swapping to a different charger, often doesn't bring
it back. Swapping from my main charger (a Shargeek, 100 W or more)
to a 60 W PD charger while it was dropped changed nothing in the EC.
Sometimes it recovers by itself, and a power cycle always does. The
barrel jack is unaffected.

My August test only showed that charging stayed up across a module
reload for a few minutes. That was too short to show the blacklist
fixes anything, and I shouldn't have offered a Tested-by on that
basis. I'm sorry for the noise.

What I believe now:

- The drops happen with and without ucsi_acpi bound, so the
driver is not the cause. Skipping UCSI on this machine wouldn't
fix the problem, and it would hide the typec/PD information.
With ucsi_acpi bound on Q7CN78WW it probes cleanly, and both
ports and pd0/pd1 (PD rev 3.0) appear. Drops happen in both
configurations. I don't have enough data yet to say whether
binding UCSI changes how often they happen.
- Windows on the same machine, using the stock Microsoft UCSI
driver (UcmUcsiAcpiClient, no Lenovo filter driver), charges
reliably over USB-C. So whatever goes wrong probably depends on
something Linux does, or doesn't do, with the EC or ACPI
firmware. I don't know what that is yet.
- The PPM reports UCSI version 0x0120. While charging is broken,
CCI = 0x08000000 and CONTROL = 0, so the PPM looks idle, not
stuck.
- At the moment of the 11-19 drop, with UCSI not loaded, dmesg
shows a burst of "workqueue: acpi_os_execute_deferred hogged CPU
for >10000us" warnings. Those come from ACPI/EC event handling,
not from UCSI. I mention them only because they line up with the
drop.
- The one remaining UCSI-side issue I can see is cosmetic:
ucsi-source-psy reports voltage_now = 0 while charging. That is
unrelated to the drops.

System details:

Machine: Lenovo Legion Pro 7 16IAX10H, DMI product 83F5
CPU: Intel Core Ultra 9 275HX (Arrow Lake-HX)
BIOS: Q7CN78WW (2026-04-07), EC firmware revision 1.78.
Seen earlier on Q7CN44WW too. Lenovo's newer Q7CN83WW
only changes the lid logo LED, according to its readme.
Distro: Ubuntu 26.04.1 LTS
Kernel: 7.0.0-43-generic (Ubuntu 7.0.0-43.43, newest in the
archive); also seen on 7.0.0-42 and a 6.18 build. Not tested on
mainline yet.
Cmdline: quiet splash snd_intel_dspcfg.dsp_driver=3
mem_sleep_default=s2idle
Taint: 4160 (O + U). Out-of-tree modules: nvidia-open
595.99.02 and acpi_call 1.2.2 (DKMS), the latter used
for the EC/PPM reads above.
Firmware: linux-firmware 20260319.git217ca6e4
Userspace power: power-profiles-daemon 0.30, thermald 2.5.11,
upower 1.91.1, tlp 1.8.0 (installed, not running).
ideapad conservation_mode = 0.
Other platform drivers loaded: ideapad_laptop, lenovo_wmi_*
(gamezone, other, events, capdata), int3400_thermal,
processor_thermal_*, nvidia_wmi_ec_backlight.
I haven't yet ruled these out by blacklisting them.

I'll keep working on it and will follow up on bugzilla #221142 with
data rather than conclusions. I can test on a current mainline
kernel, and capture anything else that would help (traces, ACPI/EC
dumps, specific test sequences).

Thanks for your time on this, and again, sorry for steering you
wrong.

Alex
