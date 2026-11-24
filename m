Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553417;
	b=cicC6u0NDq11X9Q3x0f3+SJRikVeoAaAbA+QQU9VNuSybX9bZtRqJdo+iRFOlTP4fVes
	 vnRiEl9/sMY7nkmvVVCtGOexHUI+qU9i35BZDnQ/2AmbMx67HBDba63o5uXGBqAhBQ6Dj
	 auKT+f+6zXwnqtUt0Ld2WNpakMrumw0dZYVUCkG6DxEUdgb2PYaBgIK/Vnw9JwPN+SZhT
	 dw+Dz+TSY0Z1I+TLLWx0rcrw124pkI3BRHs3rkYaAPeBgOlKvrFUvVAOH71D4y3XZuvAf
	 egU9mwI5ZdRvaVi4mxQsfp/6f9bb9yeyfAWQyhVxsBmo8dap9E41hTwCff97HHfdkCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QlnDF8ulAZKGPu7aCBrq01jV/667L8OVxhejMMbVnbs=;
	b=N6TN0nY8egj3ksZOhI22BXUO0NYPzOAv9ZU1yFr9EVYG6EFq7221ZJz63m1SJyn76uDl
	 b9ssSXA3ew69DWCWtuOtV0eUWlbMUfe9hIUuaShHt7A3o6hi4dWjV6HDNw2k56ykXMLY4
	 O2rtjPrcdojd5NnWQfylDbHb8P2mFxJ8vPCJCqJfMCSUch7C4xfWNDnp3iV2ONU2kyuN/
	 JgfhyXKkkblHa59qpaIpRJkHxKwKJoBXZmI/Bv8+Zbfl8tAqrocKRA21k3DBFRMHVUirY
	 mcPrq/RRC8YRQEnNWL/XsgAD6vimXZXK+19xgN9QUfyw9BxXF7wUTURJFNLD+GO42aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isffj0A3;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02BA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B02BA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isffj0A3
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a3d39e406so2030587d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795553416; x=1796158216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlnDF8ulAZKGPu7aCBrq01jV/667L8OVxhejMMbVnbs=;
        b=isffj0A39VIQf4A80ibsjQqEW7OrLqDdpvnGHy3XqiV0bZE05uwUx/iMGx4IpwGayV
         LyPZvMDBSEk5Z5vM42eGiXIBkFWfI7ePKEi25fWYfnnGPllrUu4PeNPX4fifNVs/IYSN
         C9Jldnj1SzC6T19Tr7nbs7IX4iDChQGrobNHOS1uA7Q9340zWwQn5ggGwwDaFCloW0uB
         PPw67vFaXVr4Aw+uhiMz8zq7hNEe/bS+iLvXMGfJRVyHORpnxnMqYDlBLItuE6fMDntw
         NDRyzEW8JByCZftEEKka2UcFUX+0lunsgeCr9UXcxq/gd8AiQdqaEvgrf51EYBGxsAiJ
         oMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553416; x=1796158216;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlnDF8ulAZKGPu7aCBrq01jV/667L8OVxhejMMbVnbs=;
        b=PIYhY3AJP/0ODyaDmvDV2qYhwPiy1RC01y7HDHHReD8IdzbpI+39Gf8+S1DE14fYET
         4PPos7NyG+3y00vpXwmBYoi7YQq0oKdwQYvACvGeXnUgFXUthrIJHdRpZHReOtHhRzix
         TDTKSdyatqJJI01EoOd1jIvzUSAgkc0t9Gn069wRqn+NpFiVoM3VHGqeyI28d/6xHR2l
         gWktkwpxkaZXGLTsw0BBMxu8TyIXZRlFGsOWqIi81Hp554fmgJxmxvtaLnQtBUnuSruQ
         vUTvR8U4dgTWFIVX/eav6W3tH1Yd2tPrrn2PKoa20xRx+66bTcFvvk2MhH6veJRJqDK7
         h2VA==
X-Forwarded-Encrypted: i=1; AL+hErFJSGrnQl6sOkfTFa7qDCLuqjY1TagHPocX4YLJrKLVX9hzsBYw1ZegTLMm3mAq3b0hf7dofUpNy7lmT74=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e8tgVb3ruKc74tt9OxPjjq0sVdS0ZsAW+pzIGMchz/KGu/9oI
	QLA8Bahh3Q84VAFIsKU1AkFZ4jjnM2zbcQeYqOLcBo69W9wFSWSlHXGO
X-Gm-Gg: AZFdTZeB0hqB/Sj9lTlqAsecyxWY42uPsVf1/LZIULrN2YWGkWeykNhoulvIpqRGpWZ
	ePAK4Q6mv2YKkqxLet0FkfvuOb/elwsDu0bpCUZnEiCmcppbfQL8tmJ6ywyCr2i0c/pDBCL1CLX
	33Rk/KRP0EhmIcV6Iap2GXJf8whcizNN5CV4LznT+q+xFeQyGnxGhTnNHgt1tNC095uid5QDlmd
	tM6vYkVcsx/A1VO3K+hWeYJY3kIenCNOjj2J6CuJHenU00pBqZG+zl7fCImofKPNqNvKhgUcfD3
	Kj/8bx66cV7dKLs1qjY1ktupLClDhewfFn2KLKuY7mun0je3qxjsQslaADcmcTJxm4HtBfyqFvZ
	GgtnyPbY3bNjHMZLaWsu2nN9GN2iUt7E1pnrr6H7nLRPIUoa2XFuHiwpzrBC/v+jAuUzye4JN13
	e1XtA92ThQ9evMb3hpcKr/PMxHvH1JWm059Y4zgod/DdDpzpzqkJN/ARX+9/sFu59I3Ag3Yf23s
	ucfbrrqWHVdRfAoMZVBEEiC1XpGpbh0+qLfTI0Jp2wpXa2p5GG74u1GzyFheXpGW324hV+HwjF2
	VA88966WCqN3LmF4fMkhgzOS9co/TZY+rOFtVjT+VUVneZWZDdkSX13Pvw==
X-Received: by 2002:a05:690c:d21:b0:8b3:7621:f695 with SMTP id 00721157ae682-8b5204e0571mr84581997b3.34.1795553415580;
        Tue, 24 Nov 2026 12:50:15 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028c7f5sm64501607b3.12.2026.11.24.12.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:50:15 -0800 (PST)
Message-ID: <851e3fa5-ad88-4470-877f-e977bb1a6ad9@gmail.com>
Date: Tue, 24 Nov 2026 15:50:14 -0500
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
Subject: Re: [PATCH v6 0/9] nvme-auth: switch to use the kernel keyring
To: Eric Biggers <ebiggers@kernel.org>, Hannes Reinecke <hare@suse.de>
Cc: Hannes Reinecke <hare@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org
References: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
 <20261123212105.GA18468@google.com>
 <692e91cc-e2ea-47cc-926f-6639952fb195@suse.de>
 <20261124201152.GA2227373@google.com>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <20261124201152.GA2227373@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/26 15:11, Eric Biggers wrote:
> Keys not being readable from userspace is one of the usual reasons
> people think they want to use the keyrings.  The cover letter should say
> what this series is actually trying to accomplish.  Currently, it only
> mentions making it so that keys no longer need to be specified on the
> command line.  But when stated like that, it's a userspace issue: if the
> nvme program doesn't accept keys on stdin like keyctl does, that's an
> issue in the nvme program, not the kernel.

The goal from the user side is that no DH-HMAC-CHAP secret appears on a
command line, in a connect string or in a configuration file. These end
up in shell scripts, config files and logs, where unprivileged users can
read them. With the keyring, the configuration only names the key.
nvme-keysd (in nvme-cli) imports the secrets into the keyring from
systemd credentials or from a KMS, and the connection passes only the
key description.

> It sounds like the idea is that the kernel would look up the 'struct
> key' by description again at runtime, such as on reset?  But this series
> doesn't actually do that.  The lookup just happens once, when the option
> or sysfs/configfs attribute is written to.  The key is not updatable
> either, so an external provider that rotates the key has to write to the
> attribute.  So there's no benefit to keeping the 'struct key' around
> after that write.

That is the part that does not work for a key provider. The secret
behind a key description can change at any time, and the new secret
must be used at the next authentication. This includes a controller
that is in a reconnect loop, which can last for a long time.

v6 looks up the key by description once, when the connect options are
parsed, and keeps it in opts->dhchap_key for the lifetime of the
controller. Every reconnect uses that same key. When nvme-keysd
replaces the key with add_key(), the controller keeps the old secret.
When the old key is revoked instead, the reconnect fails with -ENOKEY.

The same happens when an admin changes the secret on the storage
system. The host must use the new secret at the next reconnect,
otherwise every reconnect fails until someone writes the new secret to
the sysfs attribute or connects the controller again.

Copying the secret into 'struct nvme_dhchap_key' once has the same
problem. What the provider needs is a lookup by description at each
authentication, the way NVMe/TCP TLS without a pinned key already
works: nvme_tcp_alloc_admin_queue() calls nvme_tls_psk_default() at
each reconnect. That lookup runs in a kernel worker, which has no
process keyrings, so it also needs a fixed keyring: '.nvme', or the one
given with the 'keyring' option.

Martin
