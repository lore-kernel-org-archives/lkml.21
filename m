Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863973;
	b=h++5HID6bVAagoiQURwXVKqe1OY3K2FGoZ2FQoyyRh/bUFqgEtCnuwcEm8qU8S496xOv
	 tuT7L2EHMTBywOMkg5UdKjm8T8ZHOig+9cYTZjZlvQp4q35QIbyOqdCjjqgIxRYO3pg0U
	 grGanH4njaaLmvNjLE14XRwELmXAJDNkPHBMLNMjOWMvc16gMEqnsC4ZIJ0enMwr9FbFr
	 pH5c3ZEbcdDG1oFZHQ0xPp7N9qKhcH/qz1ZZQ69LhcqJjDoXpS5J8yf/RAoRdrpy2R7q7
	 iinBn9wfEMYCVYOBO7Biy83nonTEfQo4gn0VWk8Lhdba+8Cgkl56R9+rjeFWu7Ox4bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/lYnzqsbRzqdQw+FLS0AWp8+ipjJZfsZ/0h18RICSEA=;
	b=H5bJVmMMMBeHhTtC8e04dxfhCdeezcgj0EItqHe0aSzmetco+1YhcJgFnGt85SJs1SAW
	 3S1cyUzKR4w2tSKL0xFGNQV6cFdT1l0JrybIIu8uLGqwmedzjaFAR+uIL5W3EB8QL3TVo
	 thwNy5ahZukY7ptcKomzVNTxgyXYaKHiQbfLWzpaSGj8ZpfXvw4+X4kwuQiqHXe3D7mm9
	 Y4O+Vj09TSoKHHUiol8MBTQo3zSDb113ZAnBztA9yl3nV+pRsAfmK0hlTwFZ/G7d+b0Ss
	 s9CPZXw8/RMwM4P/9vEkq8a3tPGZUCfayeM52RtT+QbeQTkNsZ1TMfKjQt5bILZMkOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJPP0FUh;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322B606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E322B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJPP0FUh
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386cf1041cdso6581342eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795863972; x=1796468772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lYnzqsbRzqdQw+FLS0AWp8+ipjJZfsZ/0h18RICSEA=;
        b=lJPP0FUh+aCSQ+r+h2HdavGGky3SMi9aeLMbcvFe44PrNiRp9ntz9abk+Do5Q1wu8P
         26SKlrUG10XjT2TMsLeHkKYzBrYCC92K2/qYHf1NyQfKALBEviD95Xcao0Ps1slgXnIU
         3hLzJvuhDF+FjFJgZzQUhVYjOggXDMjekm6DHx87lokpEn7NNK6D7o7m/5bwySJX8r0e
         Jdu4CLnaZaWxtI5BRTm2j8fsO5JX3jwr9CN9C24/pTr5+lVTWd84lk5IRPVZgbH/zrGh
         NZsDclD+myzZ7GwzhKA1HZlffDJXNRsEGzANQbmuiCU+RqiwAI+ExztOA2bim5ic8VHS
         SZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795863972; x=1796468772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lYnzqsbRzqdQw+FLS0AWp8+ipjJZfsZ/0h18RICSEA=;
        b=QoRpDeJ6DOHUOfVT9sLtKRl2utJxEptzOv+OP9zT5I6GLqJLSmxwxPd+Bi0/Z7mYVI
         MV2kCOhU4pk/zMhBm11Cmm6hkVIt+/bY4tusEjmuhAq5/8IiXXIG1mChsWJQfPS/ZtvD
         z9QfNw5RoZ8tnSm/Kf2c7AjdmKld4LCT/R53jyZHshz71p/sVBpiKm1Wz4Z5BWJuPXH2
         NcWDhxG3MaqkmzC0XyIJlgppy+w399Z9B9uYO7rUoSQquvXnP6vzvsuufgm70ZKkuzFc
         yJbTzWWJcO5VH1gTIUcfFH4MYO1YV6D6ZUIKhR41lxgIjyKelF7itP3kvXEJkXZWdYWc
         FBjQ==
X-Forwarded-Encrypted: i=1; AL+hErE94j97GHo5LhzsnMgFEY+9YqygY+jDK6lHXDqOZXTeJj4fQ368yJ6gXoFta1cVgs05mdfDSlVPHAtPOuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UMLogcf+9QV/EIko2xLZPtxmHEe64iaNaULblxmHUDEgsBpWA
	HNGs5l0p5o27f2nFXNaAXJFtQZWQd7Cp8sIW/UFVJi9yGWkugOLqyJgx
X-Gm-Gg: AZFdTZftlKyTlHSt3x+0q4TcsnSU9UQqqYns37ZwNdNx5lEV8MVB0hJb9ksF+jEzd81
	uK8WvNxejxA+mQB59bGsz7U1aMEANtszI6xM1hQLlG2YfiMneizf3kqQKRaVijl3vspSxJ5HwDk
	j7WzzTEdWMLZbS6tmOZwBfforNsAmszT85JkNfgxqmqAiJqcuv3S0XWPkLEu4m4lr3wdf1LzvDb
	At8AK675bkIZO4169+L4xWhCWYGgTxayrjIKdZJFuPgiV0zjTOOWJhIZsazJAzPm3aRqm08hevK
	ZqbypqfWot55BBOIgxoe9Jr8KVH6WGuIuvR8qFSXaYthtshTViYz7plNaCBk6o3Ewyy/J3CMT2K
	vj2BKHyxx+XTo7YlQBHud0XAS99grg1msU10jRtBPuL/MOC+9p857U7ATCLiPnv2DtFg8GGbXc3
	WCTcEGQuABacB2uK3ZsCVXx8I1LlbSVxqNEq0d68hPf20i9YKiwTd9m4BMI3TUulswWvZY0+rFb
	Ptjfya+T5S1j+lSNG5pLWEPyY4P2ntprDOWW212t+5/Sm/42bBsbyILHQB9Z/xi4LkXE76lppe3
	M5nDslZTx7I9Jvu208Sz/uhmu7qz2L64D/r/D27eNa5VAOv2bjnG/7s0AF9WJmPWbwUzchoJJzW
	gVSbnh09N4XjU5TUhFNEBHCx6OVhQQ5iJY8RuWmV5+vRhl4FCyFYY7ODaZnCq8M57+FgDpZ5d5p
	C2dIMGlhZORuGlsAmbV3p9ePCaBr8mtDQYq36XtPDQGJPQ8g==
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr42031310eec.27.1795863971908;
        Sat, 28 Nov 2026 03:06:11 -0800 (PST)
Received: from spark-da2e.tail8e743c.ts.net ([211.105.22.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm40958970eec.17.2026.11.28.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:06:11 -0800 (PST)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: David Rheinsberg <david@readahead.eu>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Jinmo Yang <jinmo44.yang@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: HID: uhid: NULL outq entry reached with head != tail
Date: Sat, 28 Nov 2026 11:04:04 +0000
Message-ID: <20261128110415.772810-2-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found by coverage-guided fuzzing of the HID subsystem through /dev/uhid.
No patch is attached; the exact failing interleaving is not yet captured, and
I am reporting the observed queue invariant and locking mismatch for owner
review.

Kernel: mainline 7.2.0-g66498c75b4f8 (arm64, KASAN)
File:   drivers/hid/uhid.c
Impact: NULL pointer read; kernel panic
Repro:  syzkaller race; independently observed on a Pixel 9 Pro

## Report

KASAN reported a NULL source read in uhid_char_read():

  BUG: KASAN: null-ptr-deref in uhid_char_read
  Read of size 4380 at address 0x0

On a Pixel 9 Pro, hardened usercopy caught the same condition:

  usercopy: Kernel memory exposure attempt detected from null address
            (offset 0, size 4380)!
  kernel BUG at mm/usercopy.c
   usercopy_abort
   __check_object_size
   uhid_char_read
   vfs_read

4380 is sizeof(struct uhid_event) on that kernel.

## Analysis

uhid_char_read() first decides the queue is nonempty and later copies the
tail entry:

  len = min(count, sizeof(**uhid->outq));
  if (copy_to_user(buffer, uhid->outq[uhid->tail], len))
          ...

The reports prove that uhid->outq[uhid->tail] was NULL while the head/tail
state allowed the read to proceed.  The trigger churns output-event
generation and reads while repeatedly creating and destroying uhid devices.

uhid_queue() publishes the slot and head under qlock.  The consumer updates
tail under qlock, but uhid_char_read() tests head against tail and
dereferences outq[tail] without holding qlock; it holds devlock instead.
Queue producers do not take devlock, so that mutex does not make the
slot/head publication atomic to the reader.  On arm64, the observed state is
consistent with the reader seeing the new head before the corresponding slot
value.

I have not captured that precise load/store interleaving, so I am not claiming
more than the demonstrated NULL slot plus the source-level locking mismatch.

The original KASAN report carried only the warning taint and no preceding
memory-corruption report.  The independent hardened-usercopy panic on a
shipping-derived kernel also reaches uhid_char_read directly.

## Upstream status

Rechecked against mainline, linux-next, HID maintainer branches, and lore
through 2026-11-28.  The invariant violation remains unpatched and I found no
matching submission.
