Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145401;
	b=UWZEdkX169t16MEHg/NO/23Z6GKekG/XbHn8p9342lbXVULjAerUAyEEp26E2TfyvZxL
	 /5ZAXc40MsfNwi67e4gUjZPDjFaTB91OKCwuODQJh984wCwf7WNaH3ydvPOGF9Pd5P/hD
	 3f0TNRdiyXo9QYrABCA64qLkTGzy12Rpte4Gc0WTwV5QhALJsEmsOo65HUUPDMrLPWIs8
	 bCgv6VveOd4Zysw9pJYe62e5KT0OvAaI0tgPbo6J8cpsXFuhuLCrM+SAMcLhQUh7X9iQb
	 m1YWj5rZ+E7lQ6N0a1W/EJ2VnWDzONVfd0n6nxe4sVtqt7nsjSUtdbSfja69uCpmqRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2vWivvs8YtRgI+rlfkcyXQ95IULAvX+plc/aI2l6Quo=;
	b=GdhqzYY1KlQtyK/j6FVwI3o6UsZiZP03rODm9eLaFp6ZO8Nm15jWrH1wnfIyH4GIPOHm
	 NVCBVQqs+gTd/+PPbbrRqwh5R1coF0jEa7Me1ukgHfYVU+3SpAALSOlQpW+Kgup51SQMi
	 EPEdaNuItHvpQg905na+GhySmM+RF6Y1qA9y4Zqmn63rt9iGBvRPiyeMH4894UUbtYq1D
	 aQfRe8tVzmwL3454sBsXvs6YBWPAb7V8WfPJreFVvQBeXS5tu5C2F7ra2WyskLc6OfnA0
	 CI/wLiD6FIzelFodGBWrwAP/St++DCdu1E+oPgpCWIDdQunn7hJYXp1hKR3FoQoOZ9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gwxk3Cn/";
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4726D606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4726D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwxk3Cn/
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so76199eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795145400; x=1795750200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vWivvs8YtRgI+rlfkcyXQ95IULAvX+plc/aI2l6Quo=;
        b=gwxk3Cn/mZz7Fm9SMduk+roQRXdbl3lpcyixQHAN8Zhyd7xUDu6iEnrQxA67/WrGQd
         OIzvxkh21Dd8zny0utxMDDDEHzddmxyVQvsZ7aD9za/Mqx+ocAbdXSW6WzgqUHHwb8ik
         zLLvPZB/TpCwK1kmnGQx5Hgw6u+XMz02c/EWc/qfKxgvf/J+uAvCOEgTQsAuGXotuvTC
         8wyAdEhMj7RJA8OnrW3CG98RA6Prm75q46caPu1DrwMQtdZMyMJ5CE5ek6OQcVTGySnx
         oHC4Zcfl0u3h/yhPjQeMr3/P+X3oXBka606kMvTO6dbCjI7ysddrtNB5RqnR4Q2Xw2pC
         tQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145400; x=1795750200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vWivvs8YtRgI+rlfkcyXQ95IULAvX+plc/aI2l6Quo=;
        b=QrhfcKhPPAdhPgEfxnwevm8geTV5esAthPkFO8fLQWTM9a6UggoAaSdZECS2c8jXI0
         hMOded+lm2YQ16CjE0WOW5rUqaDCYjk+wGdvWTA8szR50daPBvp37/xAxzy6nzFuD0xC
         cXeZI4DrO8lq9GQdaQGE1THiCIB4y8q6IrBC6Iorl8DnnKBrIGFT/38FyZHsFQXt9GqU
         AJzGgz8oD5wdUxMiBJ5R3Hz6JSl5daRj9Z9pZHu6T0PP5/hs4jtZ9938plIDnl18iWeH
         AmsPZ7LhYAXrxoY3SxX5KIS3gZSyj5OPUR9IXSDD1trxwMjY9T+lEnNjfAmXC856MXUe
         QtpQ==
X-Forwarded-Encrypted: i=1; AL+hErEdSkEL19ovSONsQLWurWvI0jXNTaqyVPg+bdWgYgefqUc+LivUQHziwrc1Hyv4JkUsi5oJCWFFVVhyR+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G05iL0Xc26XOY2paGCPGMTHQzD1lUIpA78n2T/QO+7JRwfzBE
	9s7EHezvWqXy19iwclsC45VHWlfq5ukjlv0q7rxNvTQNVw+ztMuRKIPE
X-Gm-Gg: AYBFou3OW/3KyrhtWBMD26foOdezwXbM6c1mzBiAPZh04ZRzhBChe9arpZevBYBZgay
	wgr5Mpf/fXNr/4+9ToKoUJGwXkg9ckq2UAlrIRFUbiq/u/YlLU5vSDG+rmtXoPhtzerieEM0Y9I
	OMo5AVQK9dZXDe4tarrnZYNtrQobL1LTlx2Sr96HrnB/kpq6bNGTckwBzCWtcLmIyZObjzw5zd7
	Zt5g0S8kuoPtmuHJZl3spkhfE+SrsqBgRFwhHpazSvoroVqUS9DkTGtMEn+vUBhP5kL8hiMTGKg
	17V+YcUyNrvX5eSC6koWHbCHdwXJ17sCXW2qUKckYH+95rgUEzdr8gEV1vC9D+4KQjVORKRE0+6
	F6RAKZtoYWtd9bOKVQ/PUtOUuLJL4JzMwLGcR0LvTOgzipKPqWyqXHa+NbWAbP6z2eEeSRfS3VL
	nwh0noex0xlz24NYv2YYkrLDSgyjaIrUVIrQnd166+545z1xnSogxt8cH4G8JVhnBRtqrn17xrj
	ctqtXCnEYq5bs6PssSYWzJCB7ubBvJRTD7Wf1hOb9aOopHMGjZIn8FvTQVf2FRy0nzu+0uu987B
	X2fQmufxBSi3yAN7fNH8Z568lk6Si+hcI+XBo6ej1w==
X-Received: by 2002:a05:7022:b90a:b0:199:4f68:7710 with SMTP id a92af1059eb24-1b5567b347cmr1783883c88.2.1795145400269;
        Thu, 19 Nov 2026 19:30:00 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e644dsm4362507c88.5.2026.11.19.19.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:29:59 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com
Subject: [PATCH 0/3] mm/migrate: batch PTE restoration for large folios
Date: Fri, 20 Nov 2026 11:29:46 +0800
Message-ID: <20261120032949.2036731-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

remove_migration_pte() restores PTE-mapped large folios one PTE at a
time, constructing each new PTE and updating the folio references and
rmap separately.

Following David Hildenbrand's suggestion [1], this series batches
adjacent migration entries with consecutive PFNs and matching type
and flags. When a batch restores the whole folio in an mlocked VMA,
the rmap helpers automatically mark the folio as mlocked. It also
extends pte-batching to device-private folios.

The series applies on top of the mlock tracking fix for PTE-mapped
large-folio migration [2].

[1] https://lore.kernel.org/lkml/5f9c449e-43b3-4732-9c14-8199418cace0@kernel.org/
[2] https://lore.kernel.org/lkml/20261113083927.2727599-1-chenwandun1@gmail.com/

Wandun Chen (3):
  mm: factor out common softleaf offset PTE batch scanning
  mm/migrate: batch PTE restoration in remove_migration_pte()
  mm/migrate: batch PTE restoration for device-private folios

 mm/internal.h | 28 ++++++++++++++++++++--------
 mm/migrate.c  | 51 +++++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 65 insertions(+), 14 deletions(-)

-- 
2.43.0

