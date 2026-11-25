Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609135;
	b=0VgMKbKsUEY/nT/0f1Clqu+gTp2j2GOL+rYUYQCa5F9QIeTqfvY0Pm6qZOV04npfcBSk
	 3wb+WxEwJeePNTzmf2yEUbP8qrzcE1f8HV1NEDQ90m4E5GpOtcx/LYnPKY3wQNU8LHeWn
	 9+N4BTxkFm5Eqs95ilrEBF3PT9OkOe9eiLp4c4FHHrShQKMAfhb2NcFHMcu55mDTSqScq
	 1GfQ3lG0t2hOY6nodaiVufkVBxfm6YQWDbfBFAVVL/PfPEGOQvQ8DtbYNQC3GXqOoJCng
	 D7nHX4Ha3mXwm9O7DC8Qm8w6RB6MExAOSHvM6+AKBPsTkGboRrMA4/uVCrwbt7Ocs+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EipLtkhh3uSERmjoF+5iUVrp459pGW6lqIvnKgJ36K4=;
	b=qed/iy8f+l8DN06pHs/7VvVKDOyuSzif2qd9eq9qRonXOuctRsCYGKXYY1uUmeaMlLq9
	 YqPqRF2+lsHiyLVYylato+4P59fAMeEVdxtEhUPoUluzq27l653Qlr1K5kw/nID+SdY98
	 Ke4NV1PqDTSeB7Ito/vgs0BkpviSDpqA9MeHqVTguRQ5G/bdFSZ9w3/8GG47t4gQged8F
	 cpYGMfu3czIZfz/EMqSeqXjcfPDYi07gyzJecmF0FgVTOCx5AnkU9YS4SAYpRlJIlkNCx
	 TzlfNEijF3NbultiPLsIc7EM7+Djr0g3Zv1pKUvmv6HDrsbqUkzuI2vuHJbobsXDuCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzZq5tRm;
	arc=none smtp.remote-ip=74.125.224.136
Received: from mail-yx2-f8.google.com (mail-yx2-f8.google.com [74.125.224.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEE8606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEE8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzZq5tRm
Received: by mail-yx2-f8.google.com with SMTP id 00721157ae682-8b35e6f613dso11615017b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609134; x=1796213934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EipLtkhh3uSERmjoF+5iUVrp459pGW6lqIvnKgJ36K4=;
        b=jzZq5tRmC+1AmCi2cqdA7tvizyeSmyiH4VGF02a+e6qFRIZZl2Z2yNkYJADWApHtNz
         25RNrhrndPHEoWZbI3BjlSTjK6gnrgayPHp/FFTDuWG+Io58ot0hsM0OmgXIm6/9TZDM
         2av90NcIm40kvdM44XLq3aRT4z1XkIhJqGEzcg9vmh8C83gSW5t3BexKlNnnQ3TNTRh2
         3p3PSRKW7PNVrZq6Ee/6hTuF2eDtHBioM3SKhYooPlsYg9ao7mDIseFQZ5+sFArwkmlU
         GC1wnRDsCsMU0d5hTkWzaMvqbMGbaTZWeNmJzzh/1vJMLhNg4uQ9TPzSZFDBJk7IWd0C
         MaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609134; x=1796213934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EipLtkhh3uSERmjoF+5iUVrp459pGW6lqIvnKgJ36K4=;
        b=odvqV8vp5q3o64sHbgdGHshpFqrAtZuCgk0gCDV6dRVa+5GjYJgG4EG6fS406aojUX
         a5xE5BYMtvvzlPDcPg7nl8LMLLufo0R2FRJ4B7XVXDjURSOpAmu3XRzkJSbvH1UZ0RW/
         GHsvPCby+eIqfqhAfH5K0IAIUdKHUuXwDr76ructJyQUqV+2xQ406O0QsV1WCFTE2j8k
         4KYteNVteBO2kUUP1J3Gr9lMO+idvSNV4c/0YX8WZO5JZwb2i3wAoifciBxQIIdcID1K
         wLPZstgYPo4YBmKPmdD5W+hrA5lclwsCLmOAOxVsCG15k6ML4n4379wqQuQ1a1XHjiZU
         RQFg==
X-Forwarded-Encrypted: i=1; AL+hErESQdTuy5geGTCtVnnTzwYoeyXmDIh9EtrzmKPjl3vSMfWaOHFU8dFmL+t7mXKOkEWNLh1UYJJ8NOzzPhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TLw5HrC28PfGAsFvFOLyO45NWPOsoiIfBLCO0modAWZRdAYul
	dVIE/mzUxfNA2XESU9EXJkuz2Ubf6UX46JZlvzkY190e41UQKSNSdOmH
X-Gm-Gg: AZFdTZcbEjr5M9uIAfbiT8mlKuK1ajZUdx4MZ9Eka7rlbsxdcsmS5ET4k/Zib/lEZHr
	nhSiWxBTIb0EVy9mi3vizlnr1neJLTFaLkWtlAO0WroGZ5nPP2z4GMSx3Tedt3rtWTMxEt+Xw84
	LvAvzqh279rUWM+fqDuedhmzb7T+WKdS4Wv2EnrGMUGnZ4lYuUFogPF18dgf2ZK67bK2Vv3yR0x
	UGT12Tq1xGMHm13JOpAhHjw6EulnWiCC1HABNAds8LQrzQeddutf9IDzn35Eig4w0DppR1yHu0x
	PGd1b7zfW3juarhcPvEzwQXhgZ649C5tHRNs7wBUwNqBe3Dg2e0CSAKCzc9R8Rq1uDtSgotn6Ey
	ZrI4mM/pgRSR55SPzzD836oGq6qkkdLWf1G8eTina5mKdPE2NY+fRoe0kNX4VIiIkzCkr+p2Ckk
	H4CkFVghf4FzxiVBo2iOGVspeK7WOn81R1qH6N7fEG7cHAdI+LbWac/BW+vgeOGmV6IxWQsvpkH
	GaBXyHNO1r1LLDS7vdYhUfkcAAwccmTmJJbvCBhyTMlYWqqWCd1KoSWmxcb36zQLqTIIQF5yqOM
	P3SfejEKnmM4u+oV5PBMdJZBTzjnerIGVgM=
X-Received: by 2002:a05:690c:905:b0:8b4:dfc2:bea3 with SMTP id 00721157ae682-8b5204e9094mr85848277b3.50.1795609133907;
        Wed, 25 Nov 2026 04:18:53 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202b09c6sm72601307b3.17.2026.11.25.04.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:18:53 -0800 (PST)
Message-ID: <a71a3d9f-0f19-45f4-bc98-a5663ad537b2@gmail.com>
Date: Wed, 25 Nov 2026 07:18:52 -0500
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
To: Hannes Reinecke <hare@suse.de>, Eric Biggers <ebiggers@kernel.org>
Cc: Hannes Reinecke <hare@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org
References: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
 <20261123212105.GA18468@google.com>
 <692e91cc-e2ea-47cc-926f-6639952fb195@suse.de>
 <20261124201152.GA2227373@google.com>
 <851e3fa5-ad88-4470-877f-e977bb1a6ad9@gmail.com>
 <20261124213222.GD2227373@google.com>
 <c2163003-948c-49fa-815e-b1f91814a80a@gmail.com>
 <561e1abd-2430-4808-af99-cbdd3fd86d31@suse.de>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <561e1abd-2430-4808-af99-cbdd3fd86d31@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/25/26 02:26, Hannes Reinecke wrote:
> And the other problem with your approach is that DH-CHAP
> key don't actually have 'names'; they are just binary blobs.
> If we want to refer to them by name we first would need to
> agree on what the name actually _is_.
>
> What we could do is to store the key serial in struct
> nvmf_ctrl_options; that would allow keysd to provision
> the keys and rotate them via 'keyctl update' (or whatever
> it's doing internally). And would get away from the
> business of having to come up with a name for the key.

Yes, a key serial works for me. The kernel then needs no name for
the key. The key description stays a userspace matter:

- The admin names each secret in the configuration: the connection
  configuration of nvme-cli or nvme-discoverd refers to the secret by
  that name, and nvme-keysd's configuration (or the KMIP server) holds
  the secret under the same name.
- At boot, nvme-keysd adds each secret to the keyring with
  add_key("dhchap", <name>, ...). The name becomes the key
  description.
- At connect, libnvme takes the name from the connection
  configuration, looks up the serial with keyctl_search() and passes
  the serial to the kernel, as tls_key= does for TLS. libnvme already
  does this lookup today, to check that the key exists before the
  connect.

For rotation, the serial must stay the same when the secret changes,
so that a connected controller uses the new secret at its next
authentication. For this, v7 needs an .update operation in the
dhchap key type (user_update() should do). nvme-keysd then rotates a
secret with add_key() under the same description, which replaces the
payload of the existing key. nvme-keysd does not need to know which
controllers use the key, and no sysfs or configfs write is needed.

For the sysfs and configfs attributes:

- For a key from the keyring, a read returns the key serial, as
  tls_key and tls_configured_key do. The serial names the key the
  controller uses. The description is available with keyctl describe.
- A write of a serial is rejected. The serial is set at connect, and
  after that the keyring is the only way to change the secret. I do
  not want a second way to change a key: a writable serial would be
  one, and it would let a write point the controller at any dhchap
  key on the system.
- A write of a raw secret (DHHC-1:...) keeps the current behavior,
  because existing tools use it.

The same applies to dhchap_key and dhchap_ctrl_key in nvmet configfs.

Martin

