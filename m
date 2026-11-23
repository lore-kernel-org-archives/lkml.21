Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447939;
	b=pL6rhBxdMCJQqdW75Y6Jvrg+1ZNfow6HYpNoatFNFrXXB80Ufbliou7T2LYSV8plCrmZ
	 hAZiabQra/QAbO66LuyigPBBSmwrjjDaY7GXMYX8X7aTvO02IX3PWEql2mYaEPHer1Mhg
	 cIqx5lZAyhWg4qf6T4B31CB5C4j8VyHzo+n0vPxQs+Q2v1nAXSyU3yNq6mHNyG3NNkcBX
	 eBB7FsRgDvzmiMmqpc1XUT5aS5qNQi2BZxORyzKbQmZlXTfGxt8bW3jmNRG3hcLpHF675
	 r0nVJ1eMNoOuaU+wlQTXedMJaa431paFxihSxrZ4fpcO0jXAL0UbKj8XfOe3FCnC4/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/iuEShb+SCbUmAuhOf/JItulqcNTWtm6fApHRcV/K00=;
	b=NtTxW/JWJsEAvzSqE5+qxY/V2puiEPGuWlA/DDfk/AIGOwc2ZHvQHcLAJRiEglhdWcNW
	 FLK7b95IVptwN5VIADL3hfUS04fBuo3IIiUTTcYf/5REoVpzB7+KXHzdRJmWSPmmxhfTq
	 DUlaVEQfXSgTTXMpGq5ICznwbrXuTFle8OsQlWXEQuoA+t+8mJx2Gp7cFa4lxa28Yj5UC
	 HcS7hgJwfffCBPPBdexvAOjQzf0CWLkT3kyOWbE0eAhmFtWvHRefrvfqPqD/iy9Phu52p
	 k3kpLB0tKXyDCYbyCLKB/z3GiVl+75UCb+RlhxsxrUltjr+vXtoum0katF5scHUmH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V486gEZ4;
	arc=none smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE68D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V486gEZ4
Received: by mail-yx2-f10.google.com with SMTP id 00721157ae682-8b507dc8215so2704257b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447938; x=1796052738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iuEShb+SCbUmAuhOf/JItulqcNTWtm6fApHRcV/K00=;
        b=V486gEZ4artJNDxunTCoey+MkjvDwWG5yIkxswECUBHtLwO9FvanMo2nWGIPOcfc+D
         ZR6sf3+pv1R8xn/dqdRMpqiV3QuX3MOpigP5A+mc2dPnHVX7tuxfRnH/1eey6c1qmu1v
         8jjuN1nepfIs9kC4E/S2f4S8bXMnDSTc0dXgr8Kofhfh4lCSD4pWY5xmeOxHSd/Emg/L
         jUjO8pErg6PA3+6THevpE5LnCflOr7HAkZPnG9galMMRI3SY4doWS8DmtCVFXKu7J8CB
         NR53sSVnvGmo36cg5c+y4dtVs9j3E6/lMC3XNUhUzPcEjqFOMFbB02BFHHW8Z93XMxlP
         Gn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447938; x=1796052738;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iuEShb+SCbUmAuhOf/JItulqcNTWtm6fApHRcV/K00=;
        b=yxIuQwjUXHTxeKlElRL4CPdqWkhFB5r6A/eLH2j4PnIU2LgUD1M3VgtsYdiDZ6KKDL
         Z+9TXk2RIP0WhgGHcbQS68MTUcRyxyxGEhMflLccZgeCvRDxfwk2q+p98HBaTejfALhE
         3ur79o2+S95IHWtJQDXynEuEe52ScDd5jzyuy1B9d8MCO+BsH81Yizy2mx2Nw3X3cTGw
         Loha4GrCqPelSIWoEnIzIVHeI1RjIBtri1cMPCMOzJM9Azll2HPt60gCDiF0RkrDTFcs
         CPkRozexSbcHOrR2ejyZ9ACxycL6RtGXQSM6N0ZELP0PGJXQk5H2mlQIhpvgaryoKSWj
         /ubw==
X-Forwarded-Encrypted: i=1; AL+hErGYUZfoOhSwOeC1xMszmEhmaFmaVz0NDDMypmpGBCAGIMnAjTVY451oq5SkcgP9AmGGs4C2UuYuP1FwSAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P51BabnfkUL7WG07EZroGVIUOJjK0oH6aYLN64C04sgROolj2
	Tnk3lUg8KYd4UApVpLrI8UEkk9aIDkeDbR1cUvyeMs8ZXmnLHo/Gyoi5
X-Gm-Gg: AZFdTZcWuJGOXcV6W8Pk58ORwVk6Mx2sRQOdaJvaXdEACBhw++vgnBFkt8n/8Sn6+kp
	ukdKLHBpsFq4z6KPy1hc96Ctk+6rvyHGTGs3nDh/d8OsGg8uRvboAsjuQXf1jY22BH1ieUm9GdT
	qIEG5Ak0v9SxliOPimks4naB7Ih5dmi0vLoaXbCopbVnwQzyEDRKhawZUxZ2QqoTwA0VtZL+j4g
	6qzM/G1tmloNWoxoIZgF44tql0+RJ1dv3xxyv40hB1ccjJxH4w1jvsD10v/vR/TyVrxacEL0LPb
	hdQPRhm8S1HkWVgM8HD6nCJHhPgfuD/tCcx0VHlqV4eD8v1MDqFCkViJqAXbaG7HhZZWjlOkVTt
	WlT/K1qYNvraXdHAMayu+uCkidQWQaU37NnhQvgTUtCGYxjQc4iMKXq+i8XJrH/GfexGWyvEThp
	evHhdquNrb+6UD7PTRw2YYd2v5eHE5e8g5L8XELdRRpmW+cX8cIC3kutRmw+GDrc/LhX07/fBkH
	3v48+jgXSVqT7j8UnJWCgmHWWfwB7G7j9UPJMTFPW9Ei5CyQBCfw/NOlaUkKk60fZw5JkocU5RQ
	zaQ6pcJwuyytZ0CDm9qX6XaO1sfdjq8n0Uk=
X-Received: by 2002:a05:690c:e908:b0:8b3:3956:6f7e with SMTP id 00721157ae682-8b52043cdd0mr44199647b3.12.1795447937296;
        Mon, 23 Nov 2026 07:32:17 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520c5b6f7sm45871217b3.9.2026.11.23.07.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:32:16 -0800 (PST)
Message-ID: <463a55e8-c2ef-4d83-94ff-7599c7d931e6@gmail.com>
Date: Mon, 23 Nov 2026 10:32:16 -0500
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
Subject: Re: [PATCH v5 0/9] nvme-auth: switch to use the kernel keyring
From: Martin Belanger <martin.nvme.dev@gmail.com>
To: Hannes Reinecke <hare@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
 <5aa50b65-c502-4b87-8f09-23a456e2ca6a@gmail.com>
Content-Language: en-US
In-Reply-To: <5aa50b65-c502-4b87-8f09-23a456e2ca6a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/23/26 07:59, Martin Belanger wrote:
> How should nvme-cli determine whether the kernel accepts a key
> description for DH-HMAC-CHAP?
[...]
> 2. Use a separate option for the key description, for example
>    dhchap_key=%s and dhchap_ctrl_key=%s. nvme-cli would then detect
>    support through /dev/nvme-fabrics, as it does for the other
>    options. It also avoids having one string that can mean either a
>    description or key data.

Hi Hannes,

A follow-up with test results. I added DH-HMAC-CHAP support to
nvme-keysd and tested it with v5 in a VM, with nvmet over TCP and keys
in both directions. Import, connect by key description, a wrong key,
and a key replacement all work.

For detection, nvme-keysd now uses add_key(): it fails with ENODEV
when the 'dhchap' key type does not exist. On an older kernel, the
connect fails with "Invalid DH-CHAP secret <name>", which is clear
enough. So nvme-cli does not need a new option for this. A separate
option would still avoid the ambiguity between a description and key
data, but that is your decision.

One finding: add_key() with the exact secret length, without a
trailing NUL, fails at random with EPERM. nvme_dhchap_psk_preparse()
treats the payload as a C string and reads past it (the bug Sashiko
reported), and base64_decode() returns -1. User space passes the
length without a NUL, keyctl(1) too. Could v6 parse exactly
prep->datalen bytes? For now nvme-keysd passes the NUL.

Martin

