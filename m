Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438798;
	b=TfTsGGlXrircWB5bjWOJ/m/Va9u4pLvhAKAnniNUS/n6k5at7d3PorOT/6agD2i/9Ia2
	 QETkW/LMWdPbgGtKYIJlikl99LpgTaEQgoN5KGcP3Hbsg0QuDOoabtHuN7u3EFMDRn+eV
	 PHTvfjVvQwTR40/IAu6LMtMA6U83ZeXaxnctZZw6dmoKiqF+TT7xE49JXUfRuSX1aTKqU
	 QOwoDpX2qn9qtTFuHV5jLw6HP26jP+txtCqdYO1Gi5j9nN5iD2m4x3VdWRwyNe/jXg/E0
	 Kj/FAtkBNTpybhriWoGr1x1/ZNwVVC2Sb9QBYXFQj7WWIzxnJZofDZp3sj/pJh+TxFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=10ub3j2HnuKKy3PwQ5fhzsA9SVqKz9iTsj8cAH1973A=;
	b=5kWysgCcih8xbsPkJh1rj+MeDE2h8CmpJkF3xbXiftw2ZsOuteeescKC4sqHdLsqtZJ3
	 Jvs1Ll2r4R42yAZWp2a2qc6RKHJJombSql7kuXRW++F02PK7mDgMT/SX2Cm6nqhvO3AN0
	 fyYu5kq5K8dIMkXRfCH2DyUjoX58zGXEN41nHUpCaqOoMkWSrBfDcBINSf4QMv6rDq4Vk
	 tSOpg9jhHNH6LHxdbDSNBZOG0wEHsfGId/UIKgq++y7C+hEIrs+VVWUir0sAcjofqxsR+
	 zWp6t9WGiypyg7O7HRlXOJGHsdWzgOZZmScCF+3nHlKBTr/8dB1siSkYmF2iGrGoD4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAaZy1jS;
	arc=none smtp.remote-ip=74.125.224.134
Received: from mail-yx2-f6.google.com (mail-yx2-f6.google.com [74.125.224.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C32606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAaZy1jS
Received: by mail-yx2-f6.google.com with SMTP id 956f58d0204a3-67dbb2a2459so261751d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438797; x=1796043597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10ub3j2HnuKKy3PwQ5fhzsA9SVqKz9iTsj8cAH1973A=;
        b=ZAaZy1jSAHb7BASEozmL37uAbbKrZXlnB+wOSu24zx920RmE/Xt8n4iplk2FWMSnjH
         nhnMrT9LxdMqJ4+L8QJkRtCndj/2IMFU/SvK9F2YW/zQZtlGMa8T8f4IA0CaT+wmHfWV
         gFgr4aMkNw5bm+ncGaaLsfKGw81kmUbhfRqLCY72ELARbRyqtWxEVBIA7jIRjNQPqdo+
         wlFTUY/rZDNmEwrlcS2z0Cfst4T91ifAsuSPJjFdOqXPlAaGWYB++qm78HWM2Ec1jrEO
         lMgD9W+2lRL1/32peSpgAqv0J6umaFcX8yX2oVD521rXV8xRCsHR1lp24SzVzudbdHnX
         Yfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438797; x=1796043597;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10ub3j2HnuKKy3PwQ5fhzsA9SVqKz9iTsj8cAH1973A=;
        b=hIXhxqG3TQNpwfA6+UfRhiDnuwm8ylcl5849wAa6m2uILCspijjqcq4hmoMgf2o39P
         lXN2rKImNmYRXIJA/DJB1+bgzwKFkoELi3y+2eewuyvXKAo1Zm4X6WXWb9NytKpMoh2y
         NrclZIRKa+CrnCSrEZgQyC7Ix10rBn1FJRZUYINXUhzUQDIU0Pk+PjENf2uepOpkuJsG
         VOKWUbG2jQ4B/CT1E5yms9uEQ+rGROJASPzunr00QMTBO2tqKITiZdfBtXASQp99qyGw
         vkvvB4ySUw6VWD8QGaJT8ctmCWIKUqAudiruaIZGwQtjSp+vb+ePhwB39B+nes2IQC1n
         QecA==
X-Forwarded-Encrypted: i=1; AL+hErEgXrLLPXLGAjvevAkeWa45pnm131wUKtUMUQtHcao8VXIT3/Fq2mBiKaFpANntwW/MESTPdEw+KyuDzIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/Pu9zNkodUC51p8ZpzKONY4INbTW7ngEK/FZENhpY/rWIQUHV
	scKIxmbcHKlkPKZqA8QaG6+EwtDAyia6qt6CPmO65RlNGE3R7ElarGb1
X-Gm-Gg: AZFdTZcK6hSNWrCIzGn451awBSXe4R1ooKG7PfDXXggxFvAqK9hktMiUHR08L7tmdxp
	6WCDBkpCfWxMbMSA6ElF1ZXyPjFiCmfAFq7xOm8W4jZT27X0H0T37sdLp8RW65Xj4LgTYMGUh7i
	+q1CHrVoosTP7lGLwxiddRxjmIQnOmbZEkrvX5kQ2bDWlo60cyY2XpsSj0J0PYnpMoCFRFft83t
	06OYHv7mY83MGUJigPt6Wxk9Akpka/w08VApTT2cfgja+2TigfS5GmpdJKYlUECrUnDIzBkF8pr
	beCamaP541Fe31Xfoish38JVS3jXAKf8Jy0xWYUPEHXBBQECwXsgm34+TAUfs2xBfI6xzXp1Ug/
	bJtj/3J+C2yKTv+wDkUVWj8jYLYxUWQxIj7yqmHSeLeZUSiyjhxnF1Nws5TPk8C2JviK0p5C/jH
	ykmZrucqq7DNvbtB/uiG7FEHO/P9e4L5enpJmAjs7nVWTrixAPzT6b+SfKUcfMO3QaaWy1HU2id
	CQGfOSM8KboZjdlA2zHonTiQrNxXJuknVkaxiJDbwviU2QP73DoJhe21Uuz/Gs8veNt1NfbZpMr
	pSeBvgNMhNy3B3GNLoRamYzQz23RuXHIJ14=
X-Received: by 2002:a05:690c:d1e:b0:8b0:a30a:7f31 with SMTP id 00721157ae682-8b5204efc58mr42287557b3.29.1795438797153;
        Mon, 23 Nov 2026 04:59:57 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52034f7absm44537587b3.41.2026.11.23.04.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:59:56 -0800 (PST)
Message-ID: <5aa50b65-c502-4b87-8f09-23a456e2ca6a@gmail.com>
Date: Mon, 23 Nov 2026 07:59:56 -0500
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
To: Hannes Reinecke <hare@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/23/26 07:14, Hannes Reinecke wrote:
> With this I have updated the dhchap arguments to 'nvme connect' and
> the configfs interface to either be the keydata (ie the original
> interface) _or_ a key description referring to a pre-populated dhchap
> key in the kernel keyring.

Hi Hannes,

How should nvme-cli determine whether the kernel accepts a key
description for DH-HMAC-CHAP?

I will add DH-HMAC-CHAP support to nvme-keysd. It will import the
secrets into the .nvme keyring, the same way it imports TLS PSKs
today, and nvme-cli will pass the key description to 'nvme connect'.
On an older kernel, nvme-keysd must not import the secrets, and
nvme-cli must pass the key data instead. So both need to know what
the kernel supports.

I see these options:

1. Check the kernel version. This does not cover backports.

2. Use a separate option for the key description, for example
   dhchap_key=%s and dhchap_ctrl_key=%s. nvme-cli would then detect
   support through /dev/nvme-fabrics, as it does for the other
   options. It also avoids having one string that can mean either a
   description or key data.

3. Something else. add_key() fails with ENODEV when the 'dhchap' key
   type does not exist, but this does not show that the connect
   options accept a description.

What do you prefer?

Martin
