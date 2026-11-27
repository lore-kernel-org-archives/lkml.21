Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790138;
	b=JLJvLzNSfjdLytmBymgT3YS77YJl2gl7eV7xL3JBf6IU15yT6LwQnZtmRUY/CyuZJL56
	 X0VYIYcCcAoXTc+J0Fs0JnRZzoFvJPSHC4bEUL0PGCcoejPCMCPdD9PYYqBvzJX3peZsK
	 q6ddIXIfjKaCzDSIyGePGrRKVCWb6qWSgCsAM3kK2nYynEQfB0QrmiF50dxRgjxbtf6c2
	 I/nNNr4TdcYrgd6VOoWuRXIdlX+cI6kCxRQGF9J05zpIWOzBEQG5+hKwOgMElJgkRFhvS
	 G3Zs9YhjuuJ4c1BV7REgBYYJtT786fnibzfCHaCOzwIjRFwcOXm/gMFgf8Ee/EgB5uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7628Lpv1Ui4aF9FZsnI4m4y1Sp7QMbMmxqeVrU981Ws=;
	b=AN3rmKedTgp4utRjRLa5aA0SStjb6dMmxDraI+j68goDZ58JAJKw2/dAZ4gdm/ToH+DO
	 0god83xUv5uBzSgNlhkNukINOj5ZLTTzCEHI2VRNNhXDmRACFVdrVtizuCPECR8Sgw28P
	 6kH/yqz7WqHK5z3hQGLhEi9EWrit32vBeptUYyrkr42huiX6Q89JQo5d8Z06HOAmdLNVQ
	 NjrkcCcWq8+84+pA5HPR+KmNE0HEeEwTXMHsdN8+7JpIb+FUAaZ+v2uh4Ii6kqfuSKnaL
	 mFe7DdHbIySu4Xyuso/JrP8qS73srvvPdj67rME7LXTDkgq4n+Odkd9DuEeSOgYygLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxYQVVVm;
	arc=none smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92FD606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxYQVVVm
Received: by mail-yx2-f10.google.com with SMTP id 00721157ae682-8b507dc8215so6875087b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795790137; x=1796394937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7628Lpv1Ui4aF9FZsnI4m4y1Sp7QMbMmxqeVrU981Ws=;
        b=PxYQVVVmOW3QTmnUGPn/8uXuLs5v4r8yVSS3T/M3GF2IsTX5jt4Nbh8H7ACddJ2jt2
         sYlu+5hx2ke6hDAaS5ELDKTx9oDWWXKf0Xx7w1AEpSzL9qY3UcL8IukZL1Lpvpg6jprA
         0nXF2LeidTFzmh2+cLVnwlFdTMS5jXC22NVlvhUL9BLe+wvmOFiA/0VehHoBpUnKrRMo
         FsI86FZf6QaVF9RfOqx+DHHPrSXJqATdlsFkcU4iPiSTu+e4wcQXRNPJnMk3IdRkKF8T
         ay2mGRYiqrJUCXFlzNHU1ozd/s7msf5nn1yAirhd7IxMikw63n2fNrWGC11qVGHImfdK
         iVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790137; x=1796394937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7628Lpv1Ui4aF9FZsnI4m4y1Sp7QMbMmxqeVrU981Ws=;
        b=c9tlHBT1i2H8tkHrJuW/fHjLe4oybbpgt5gLBAHSizltIowISwbRzGVPZ4dRN9Gu4d
         crz1lKoaH9KnPaTepyT6Z3kdE6ObAF4wHSesxxPIJd14hSn93+Vn0Sj0V2LQwOdc0XEv
         zSIyTK1HIwOA0dpqvQ41zsLh4ZfdnOcIg/C9XY3+AqvpxG+xliwcXj9CxqBEfy8VUjvb
         WDrGvjOruirp0hx9SSdVg0xnALDorxaCwmBW1BiN2kfUOU6WiLBCOp0jGs4FPzw/OTSt
         aD4uYwstjzgjUzPhT2ij0z/2k4f8IGLo5IaCflAZwBMbwW+sWTGOtkEfXAaINnJxbOiE
         DPPA==
X-Forwarded-Encrypted: i=1; AL+hErH9KedVnoEpaf9w6rGNuLUw/ery3kHfPZf9Fk4sxh19+wmppv/7XVm75Enwdi8/l/vAkYv4iMV9GZJILz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PJedOkufH6IBwbIp7ourVLfPF8TGc943CYPFBf7VfUoq27G2U
	6T1sabtUutMrZXcpFrunOZLw0/5TBtfmqI1l2TtppTJe/byzbJMUaFMN
X-Gm-Gg: AZFdTZexz6qTrnjviHpAEIYYUkjTUr1ai1rCxUK9+DxuKumzNqY7axiEILpT1kecTCY
	Qat4phyBro9/X4TLUHcK7+h7So2CcgL6/xmr1cjhrImXe2fNFdtzwLqsv0aLDn9C2r/vk5psAL2
	CVmzpiZCF2ZCE7ZN/N0r4PwJdSn9UW1mwFPFQmmkAW7lePrFjHV17dk8KSOa0+3W3yT8EDbUfZO
	SsGLwHSNYOOQE4OqtXw/wHPgF9hxvNyerdW3s8bfzGL7ar+PYeKuMAN7Fgpk7yMnKoL8HkB3aNe
	YSRVMZgouC5fLWDpYm3KW0U4Xh9KF1YmR94q+qDLy8Gtv9SdeaTbZHZ4UPUfw9UA/N11n+uhYts
	SPUt8DARza0GuN+C1L3lYtrxs+KQreIUKAiJu3qBGVKvyuC5FcCeryIFKQwSeP7St5qCpMW8aj5
	RnSEOZfxTB256lsM652cJ9ycyYjeLGM8HFv7yh46QM55BiCkhnU+QHdiXvSeZQXDBLTJdtn6S7a
	XmcdfAclynjvak2KUSx6yfFsu/l60CQGvhoax8QUo1pvxwRxuKNAqLyLjTI6YPcTREbCwaFnAzM
	LEymvKrMGj7RWoewcG5xza7836Q778AtjPRgKll+FPBL11T9XpE8YGkRCA==
X-Received: by 2002:a05:690c:c04:b0:8b4:c8c5:6b11 with SMTP id 00721157ae682-8b5204f087fmr129405847b3.36.1795790136722;
        Fri, 27 Nov 2026 06:35:36 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b59a06f3e9sm1537207b3.25.2026.11.27.06.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:35:36 -0800 (PST)
Message-ID: <17a445a0-16ef-452e-a174-5bb09940d3fc@gmail.com>
Date: Fri, 27 Nov 2026 09:35:35 -0500
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
Subject: Re: [PATCH v7 09/14] nvme: allow to pass in key description as dhchap
 secret
To: Hannes Reinecke <hare@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
 Chaitanya Kulkarni <kch@nvidia.com>, Eric Biggers <ebiggers@kernel.org>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261126-dhchap-keyring-v4-v7-0-ee438ffea527@kernel.org>
 <20261126-dhchap-keyring-v4-v7-9-ee438ffea527@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <20261126-dhchap-keyring-v4-v7-9-ee438ffea527@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 09:12, Hannes Reinecke wrote:
> diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
[ ... ]
> -     }
> +     } else
> +             count = sysfs_emit(buf, "%s\n", key->description);
>       up_read(&key->sem);

In my reply to the v6 cover letter (Nov 25), I asked that a read of
dhchap_secret returns the key serial. I would like to change that
request.

libnvme reads dhchap_secret and passes the value back on the next
connect. A serial in dhchap_secret would change what existing user
space gets from this attribute. Showing the description, as v7 does,
is fine there: the kernel accepts it on connect.

Could v8 add the serial as separate, read-only attributes instead,
kxchap_key_serial and kxchap_ctrl_key_serial ("%08x", like tls_key)?
NVMe Base 2.4 renamed DH-HMAC-CHAP to KX-HMAC-CHAP, so new attributes
could use the new name. libnvme can then use the serial, and it can
tell from the presence of the attribute whether the kernel supports
keyring keys. Today it cannot, because dhchap_secret= takes all forms.

[ ... ]
> diff --git a/drivers/nvme/target/configfs.c
b/drivers/nvme/target/configfs.c
[ ... ]
> +             } else
> +                     ret = scnprintf(page, PAGE_SIZE,
> +                                     "%s\n", key->description);
>               up_read(&key->sem);

The same for the nvmet configfs attributes dhchap_key and
dhchap_ctrl_key: keep them as they are, and add read-only
kxchap_key_serial and kxchap_ctrl_key_serial next to them.

Martin
