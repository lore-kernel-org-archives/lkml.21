Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639291;
	b=K7nbEnNeEgT4QgFEEVcwjkFiFQEfxDCIco+lHq9z2csQ3cy8B6N26tgI5y6xqnEXCqBM
	 9Jis5U/cBHLVz2bQPb4PyKYg9SfE8AtHlNa9eppzuNOMMoV+E9WXGI/H0bBg48C4UHigk
	 OG9U0O7UIbRPUEdbPNUVFa4qAizO4Y75oTegRWHCXvBNTJAyV++xz8jnJLe52hGiJyyI1
	 9ITqX2Arciu3fS6BFmI8M2o0aK6qZQRzKH0lHda5iN3pJJnfe4yIlcFGiDvgOEUs4+6RL
	 fzpdA/yXMjbyFRbmAuaL6K5KXgH0gu7I3dZUVU0yR79KHqs3xBaCNYlU0kRe4s1RafA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Correlation-ID;
	bh=0qait1yJ7uGinSq49biTTHsKyvdiVlra14ZPQjDoo1Q=;
	b=T+nYzj9BsNItgBuvPW1AmnOG+pdRDWl452tXIQfI5XMOi8V1KU+kBuvSybWVMFMsDJz1
	 OAUoK3DgUTYQ8+kMRQt2YF0DQSwBZ+86lIsFfaXt8dJYan1bVWOJDB/NN6Z6DmLD19Gcy
	 fJgHPTmx4NP0Gct1rJNG7j1WCTYSGc4pi06yQ8Pvr0ipdU2xfgRR3Nujg7zyT/I4Ivuky
	 JfhcgibNhpBfUZMbJeCJY17uxn5C0zbEvzGPUN0ueZ60TVAB+G4nPAxqHZFsRvo7KtHDH
	 MSak3JgX2RDTHdGIoMSod4rQ8z+uSG1y06sFY4o5fqhgONl1kIsFdGIY+knRESaxa2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4bBv+FR;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03115606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03115606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4bBv+FR
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so4429240f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795639289; x=1796244089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0qait1yJ7uGinSq49biTTHsKyvdiVlra14ZPQjDoo1Q=;
        b=n4bBv+FRXGp5cs0436t8zo5f6ZycQrX48DNOL3PinnQDIFumq0rLhLcMB0PFN1Zt4d
         K0Glm9BKKL/WbgcWB9FjTsUdUEPxQYNLA1IT9gnu3kbcx2MC1q64N5yaqSlEqsS60X16
         cFb+A3j2+SjvUzxkwUPUISz8o33uNqBlH+X7bcJyP9yYXCHTSXmhi9KGaonzNrwR5j9D
         DJHtYENrlC2EmCfV+Q+EDYIux3mJA2UviimS0wtaDyPd/Ij4geNRQgNZfJ/C6XGgwE5k
         Cj+twuc5W9us2dvtI9HZaYxguY43X1x6p0jGLPksaxVLgZTXZemBTNbefO53B87+hzlG
         KVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639289; x=1796244089;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qait1yJ7uGinSq49biTTHsKyvdiVlra14ZPQjDoo1Q=;
        b=gUNSp3TE/CBIZ3/fCecsXRO0R9OqAEzbf8aJn5My+BU5aUBz606cY/eUX2HLZlJ1iq
         1DrITAgv8avp4S1nI8VF53HfRpwUGtwrx/MVkgGUsrAqpwBHcdejMe1aBL6AUPxDuqTf
         xGvaDT1zvEZFg68VSRjYyxsWgk4pcU+qoiiyPOxbWmWit8TDynz0wtHbf/7wwQgGPXjO
         ezP7mkkFCbGq+YBw8dZytmnTy+7v3K3JF7pwyIZdKktiwZ0B+EMlWPSC4OiydX737d7E
         iCWSK+E7WNviqQLRWAMdKIo/H4u8FuB/j4M3WPv1cQYnKBSjlxd5CYwfEm9CXglTYuxW
         uEtw==
X-Forwarded-Encrypted: i=1; AL+hErFsF0zo0etjhbyuFc+yzVj5bgtOCHN60vtw7O2XCo6gpL3LzJCFf9yUO/fNpyYgvzk+Sa/HVgdjW+JVhsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i5sVsvz+FoVhBAJ8Q/KoyTmIs6IXwtEj6C0pC+l8M4QflcYCx
	r15rR9drt0ezBwpGyOAMyP9YxJGp8CW0OMhWc97A2XfqpnfFeymC6p/0RM7Oti8h
X-Gm-Gg: AZFdTZcqQ/wJhs0YoyYjOBROCY/Ry+6c9gZXSxB0jtAMojOIZnGPMU5gSlOjINwmYGJ
	2uNsiil0ghHU/TpW1MOLFlGEgEWSV974HFzfHwQ8y7uAi2E3eaBQU6womq/U2sjA06IaYXNc3Yl
	UwVbTYrZwvuW8rn7irgtPBpq4VSLnaF4Q4RjLzL0k8StmtBSLuYVBBhuJiY+U8lf3VvdbMvPbMe
	wmg9Wrv9e3KBHAGGuGPw7iNhOuv2EWNVFt+Th+4U0RkY5slB1eXK3IheW6MyjTWQXK4qo45dAzc
	Wa3iXX/Y8Im9MsAZBdgRbOw097ojrM7kAKtjKDs8E3yXncTbtOgk/nO8jBq/kKvHJBunsjOGWCp
	sQDrn+5JU96DHwAmbPKQ6dcMoLMLKJA2PbeQhFWfK0L8E7K+MUtjFG2oECBKgccVl588iCPmd54
	LXakIkv5SYmzfLN93xSoozuI4lzXFil0Vij9HORLWGZq8o7zIFHrs0nm8ajpFCbTCIjNa2eJn5a
	wFY6Mk0KSiTcvxdLeeC9rTYXqRUodAkHvkXdESDb+Mf5ef2d02lvj0MOgVAS9wM9iKeQDjvyUoZ
	iYcZjoxEvkPKnjAUB1ZcU60KGgg=
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr395587675e9.25.1795639289194;
        Wed, 25 Nov 2026 12:41:29 -0800 (PST)
Received: from [127.0.0.1] ([45.150.175.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm41801178f8f.55.2026.11.25.12.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:41:28 -0800 (PST)
Date: Wed, 25 Nov 2026 21:41:25 +0100
From: Marcus Lell <marcus.lell@gmail.com>
To: Przemek Klosowski <przemek.klosowski@gmail.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <e7a053b8-0f19-4a75-baf0-7973dec17c26@gmail.com>
In-Reply-To: <CAC=1GgHNn17ygWL0tF26LGm+=5M4KrKoeMpq9YE794EothX++w@mail.gmail.com>
References: <b8b122c5-87c7-4363-b3cc-c91d24ff4d2d@gmail.com> <CAC=1GgHNn17ygWL0tF26LGm+=5M4KrKoeMpq9YE794EothX++w@mail.gmail.com>
Subject: Re: btrfs corruption across different storage configurations. Both
 with free addressable free storage
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <e7a053b8-0f19-4a75-baf0-7973dec17c26@gmail.com>

Hi, Przemek,
23 Nov 2026 21:45:10 Przemek Klosowski <przemek.klosowski@gmail.com>:

> hi,
> I am not a btrfs developer but I track the dev list.=C2=A0 I had a corrup=
ted fs in the past, and it really was due to hardware problem on my system-=
--memory errors due to controller parameters drifting over time. I ran memt=
est86+, saw the errors, then ran the BIOS memory test, also finding errors,=
 which caused BIOS to recompute the settings. Since then I ran memtest occa=
sionally, see no errors, and have no problem with the FS.=C2=A0

Thank for your reply.
I will check that, and report back. But since I'm using 6.18.x, I see no pr=
oblems at all. I think the bug? was introduced in 7.1.x, so it is worth to =
find out. Maybe others are seeing something similar. The least thing, I'd l=
ike to see, Linux to become unstable.

> I don't know if this is relevant to you, but please run memtest (best the=
 bootable version, but if you can't at least boot in mimimal linux and run =
memtester on as much memory as you can from the shell prompt).
> Hope this is helpful
> p
>

> On Mon, Nov 23, 2026 at 4:48=E2=80=AFAM Marcus Lell <marcus.lell@gmail.co=
m> wrote:
>> [please CC me, as I'm off list]
>>
>> I know it's a late report, but I thought, you may know about this one...
>>
>> I experienced severe Btrfs corruption twice, on Linux 7.1.10 and 7.1.12,=
 using substantially different storage configurations.
>>
>> Incident 1 =E2=80=94 Linux 7.1.10
>>
>> I was running Btrfs on LUKS/dm-crypt over md RAID5, using four SATA devi=
ces with 64 KiB chunks. The incident occurred during or after a RAID5 resha=
pe and enlargement of the encrypted device. After enlarging the crypt layer=
, I tried mounting the filesystem, but "mount.btrfs" failed.
>>
>> Subsequent diagnostics revealed metadata errors at offsets beyond Btrfs'=
s reported size:
>>
>> "total_bytes =3D 20001389936640"
>>
>> - Wanted bytenr "20015028908032", found "8567551700635656859"; checksum =
wanted "0x836ea028", found "0x8db80d65".
>> - Wanted bytenr "20024023199744", found "12778909791338521120"; checksum=
 wanted "0xfd168e20", found "0x95744024".
>>
>> These offsets were approximately 13.65 GB and 22.64 GB beyond the report=
ed filesystem size, but within the underlying device's addressable capacity=
.
>>
>> I did not touch the underlying filesystem during the enlargement. Just a=
t the end. I was surprised, that an untouched filesystem could go so messed=
 up. I thought, it could be an mdadm grow failure.
>>
>> I made extensive attempts to diagnose and recover the filesystem. I trie=
d superblock recovery, "btrfs check --repair", "btrfs restore", "btrfs-find=
-root", mounting with recovery options, and "dmsetup"-based approaches. I a=
lso used a device-mapper snapshot to rule out concurrent changes during che=
cking. Despite these efforts, I could not restore a usable filesystem. "btr=
fs restore" recovered some files but reported checksum errors.
>>
>> Incident 2 =E2=80=94 Linux 7.1.12
>>
>> I was running Btrfs on an approximately 1 TB root logical volume on LVM,=
 on a single 2 TB NVMe device, without md RAID. The root filesystem became =
unusable. I recall seeing what appeared to be the same kind of "bytenr" fai=
lure, although I no longer have the logs to confirm the exact error. I had =
not observed unusually large writes before the failure.
>>
>> I lost the logs of the first attempt, that I saved on the root partition=
. I was like to be afraid to cope with the responses of you. (I'm shy)
>>
>> Because the second incident occurred on a substantially different storag=
e configuration, I find it less likely that the problem was specific to the=
 RAID reshape or crypt-layer resizing in the first incident.
>>
>> I want you to help make the btrfs filesystem more error prone. But I can=
 only point into the direction. I cannot prove that such a write occurred o=
r that both incidents shared the same root cause, but I believe the recurre=
nce and the first incident's specific offsets warrant investigation.
>>
>> I don't know, how to help further, but I don't dare to trust Linux 7.1.x=
 and successors, with 7.0.x I believe, this is the last stable one. I need =
to upgrade sooner or later, so please find the root cause of this behavior.=
..
>>
>> Marcus Lell


--=20
Return to the point of no return._
