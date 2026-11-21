Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795272595;
	b=zmtGqnqxGGtWJ91c0jy7p3dGDdPAJD/yC9gFsEx/l20VGvG/bh8x95ZSjPWncESLwrbJ
	 MPdHaaHzOI+nCDyMPfGj/P6FEY32FpkhcNaA1EW+PLhYinxI98OWf202Ow9cWiueVQ8GT
	 jaofWigTT+qutCGo/PGZnP77iHL+3XlwWMHZBbkklsX7yDQWeysYMPOzWaQz/zOKRvecX
	 2c3rr/AMtDzyM/PD5iU1dFAkDdtenkSSCC3BmWZfFxRwrdQ57PA2RmAWN0WAUtRq0Ip3W
	 1HAjClcpLBlUSg5u59zOk+AqHMQ2S1nnaap4Ee6Ftf5IACMtrSmNCc//tu6A3jLe8nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=KMleV59mDasfc9ZrDI02cJ4rVcYzhncPH8nN8fIqQw0=;
	b=MUKmDgZqfuq6IRYLlVmucF+w4x5OjtmFZb/QhGsNbB9qUJb8hjYB7ngAubdaLONSZR5K
	 0fPxgNhv0E+t0yuISiJ2MNb2irjHnScY8tKmynAuk2ULMlSmfwq+vnGsc6okSJIi5aoJu
	 AVzYDlCTAbFjNzsyW23eyT1/NUM/eZAlD+fMWRl2ogGwSDLLzIluG2A2qUgk95FWf32Sz
	 Yr/IM8RYqZ7Hev/1nw62nCZfN3ebKDQsckhrvYDyruRj5yQkL42KU5+NYH8O/TlJuh0RC
	 RKS8rTKhyEI6Zp3PBOgeSLCKfWEKQDsfdYTd3+jkb1DCRR7ASb+SnPAbOv9oiEzw3Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLkrnOPN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307AB606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307AB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLkrnOPN
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cde1479f76fso1212653a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:49:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795272594; cv=none;
        d=google.com; s=arc-20260327;
        b=Jzf4xtflwBh81yIjhU2rwdIEKVKH8p3LW+H+J5fPHrz4ADQGlO/uDytC+j4nfV/vVv
         W8BvNqIihMxbw7c/N0KspbJnByvjIjWBzHUDgcOVBQ27xsayHW8uk0aYLBiHfBvFWnx0
         FFAfVhjJU86O+71z5yyhkBYxSEToxblDLhXXUrDaswYjehc8TpgvUsuayQC/06jlj3kn
         ertmpa7fMyY8GH3jdWczIt9+bpDNc81+BB0boTEDldZAsauKQSthlyL/IeWst7oFYb7T
         JXZAYEFBk9WCGA6CmVdivM+FL3Z8/E45wm8bHmXm9m1PkSpUJPq8DJcZWV5xyDLlIDCr
         1XEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KMleV59mDasfc9ZrDI02cJ4rVcYzhncPH8nN8fIqQw0=;
        fh=os4nU/7AohS66ITw3wNBnsPypIu0tKtisbHT/EFBogk=;
        b=QebFsaHOVHO2YZWePQJw02EkWbIFN3OV1wsERp3AF0aUogYWjBqUgI5DeUt4i57Dj4
         DM7ZXhaEVmWErTn2yBktMo3JmN9TsiUCzeZUO2Weq8+U3AOTqTHQHC4ztlnYp35zpIRQ
         aFBhsgcbyOnBILcKsdEvKynVlwJu8D8ewfOrYxeyWGrnFGHg7pLTC2IX1U6iaRgvS4H1
         UpyZtXrymMf8+fyfY6OV/iL74hIUrOF2GU4oK/RFQpXQEkQtUnEoYADDqKYWLZ+064iM
         Q2ePJ/39yDr6FhQf8J3oql/gL+pysx/pBLGY/PWQCX12zG1fWmVGA27AXFwJtPuX2Wdd
         YFkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795272594; x=1795877394; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KMleV59mDasfc9ZrDI02cJ4rVcYzhncPH8nN8fIqQw0=;
        b=MLkrnOPNCstSi8svs6c1/FDow3Ugv34GJJ0zqaByDNgJM1EvDQpemdnCCYYuMQwuF6
         Urp0eqa0oOqVX3ivri+0b6p+E2lyNnPCSeGULskaa8ObcP7L7xAmq03oROwvjZii4vqS
         ZI4GLeDDHpdLzrnZEXJ2w/KqTHnShY/bOgs1/d/hMfvUeeXZjOaZ4zrE0+eGBNqaQZMQ
         L2SmPBNvCZvGv7BPkez5dDF0XnuiqCXZylE+rCV0/1tiPmjkyYGf5b2b6m+k96lQYp91
         Vb6Obz5nWK9Pna6LgIoOKH226aeqgnuSCN/srMhSdJFIKNaSFu35PcVK5LtiyMt815Cy
         T0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795272594; x=1795877394;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KMleV59mDasfc9ZrDI02cJ4rVcYzhncPH8nN8fIqQw0=;
        b=rPsGvp/3wWguoRvkUPTMKe6YG26IHIZfw+H/Llk7fGlWtbkjKhRgibqP/KaQjY+ZsM
         MW64uGDo/3R3IbRntgEGPZo4DtKOD/Zw43+rOjseZ0Xgl0Lp7hPgCoFRStwiKul8d4RM
         SA8JUvVD61l6s3DIPEEEqM4SW8bFi07RjBVaW9YmrMqe61IBdJCvzILRPg4ZtJMzBOLi
         G46OmseOIAKWbr9VSYJl3TdyaiO8L0ylfdpej9oEVG1Gz3aCOCw/W2j2MqNJ07iw4/Pu
         ApxgqZc/mJd1pnP6PjQWVyzEZH5uPpct9jab7FrIhAqum9gsTf9rrivnAwZOzdy/1yFy
         1xng==
X-Gm-Message-State: APuU4Z92aEzpe7pCUTLkZ1gTSptY4Sz2B/UZNcohmR+7NUk0n+CmVoJV
	O6/ArJS7rYuDPCLssTX90gE4IjSsmdLWWU8lUaFs8gatwa4N6+2gYdFcgbf8envp1EYmvjMPNfU
	Q+SJhH/h499k/ZMZ+b7/fmgXx5J3TL1Y=
X-Gm-Gg: AZFdTZc7Q8wumcy6OWtNessBYBwKPMWI9rCCKw+2mnHw76uC00oFXJBmeY9t11ppiHI
	pQcnmi6kg3Lfsxj6ryNhre8To0EeKDnd0IQkWTN2128J8f+dNR9kFz6ra2EyJBn0sjPmIMeLfIf
	4Msu7YPK7u+MMFyMA5p6p5nAK4Atu+ALWK3cFNPvpUtnJnSyOXkYki3ZDc8QwPLqJdvmFt47+ap
	uYp3R43v8vNjg4wr56ybkvRmXLArL4lHgZzvZc1FsFQZkvpzMCC/YwiVf1xpRi1ZZUo4Won09iL
	gE6duUsNscUxX/U4GlTyQt1c5SJhHhTqrGisqx1ouCiLSEYrn0sE49ojXsT3EzNmAuXuWmE19iP
	GzDAkGirCtLIBEXnaWKPuq4XlY/YkdDdPCux/vyM=
X-Received: by 2002:a05:6a21:6e04:b0:3e8:b7fd:6288 with SMTP id
 adf61e73a8af0-4014d159070mr6730389637.41.1795272594392; Sat, 21 Nov 2026
 06:49:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Yi Wen <shicenci@gmail.com>
Date: Sat, 21 Nov 2026 22:49:43 +0800
X-Gm-Features: Aa3M54o-c3umdLG_yLVUlZkiDbL2uREfVKI1Y1odDetEyJ0RRT4OIUMRc1PDQa4
Message-ID: <CAPHJ_V+_=Av8pAM+N+oc4JRmtqBjhcimh3B_pSy_N+5qecm6Mg@mail.gmail.com>
Subject: [BUG] mm/gup: WARNING: mm/page-writeback.c:2678 at __folio_mark_dirty
 on v7.4-rc3
To: David Hildenbrand <david@kernel.org>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a kernel WARNING triggered by a syzkaller reproducer on
Linux v7.4-rc3.

The reproducer triggers a WARNING in ext4_dirty_folio() when
process_vm_writev() writes to a file-backed mapping.

The call trace shows that the warning occurs during the GUP page
unpinning and dirtying path:

process_vm_writev()
  -> process_vm_rw_core()
    -> unpin_user_pages_dirty_lock()
      -> folio_mark_dirty()
        -> ext4_dirty_folio()

A second WARNING is subsequently triggered in __folio_mark_dirty() in
mm/page-writeback.c.

This appears to be related to the interaction between GUP-based page
dirtying and filesystem-managed folio metadata. In particular, the GUP
dirtying path may mark a file-backed folio dirty without ensuring that
the filesystem-specific metadata required by its dirty_folio()
implementation remains available.

This may be related to the known issue where GUP-based page dirtying
does not properly notify the filesystem through page_mkwrite(), as
well as the interaction between GUP dirtying and
filemap_release_folio().

Before these warnings, all four ext4 loop devices also report delayed
block allocation errors and abnormal free block accounting. These
errors may indicate an additional filesystem inconsistency and are
included in the console log for further investigation.

Reproducer:

C reproducer: https://pastebin.com/raw/VMwNSqrp
console output: https://pastebin.com/raw/43Ne65Vu
kernel config: https://pastebin.com/raw/dG24GcY1


Kernel:

HEAD commit: aebb7274476403040d582c61478df8f4a7bf9cd3

Kernel version: Linux v7.4-rc3

Environment: QEMU virtual machine

WARNING 1:

WARNING: fs/ext4/inode.c:4527 at ext4_dirty_folio+0xe3/0x110

Call Trace:

  ext4_dirty_folio+0xe3/0x110
  folio_mark_dirty+0xb9/0x120
  unpin_user_pages_dirty_lock+0x588/0x6e0
  process_vm_rw_core.isra.0+0x7ad/0x960
  process_vm_rw+0x1c1/0x260
  __x64_sys_process_vm_writev+0xe3/0x1b0
  do_syscall_64+0xee/0x4f0
  entry_SYSCALL_64_after_hwframe+0x4b/0x53

WARNING 2:

WARNING: mm/page-writeback.c:2678 at __folio_mark_dirty+0x644/0x780

Call Trace:

  __folio_mark_dirty+0x644/0x780
  block_dirty_folio+0x149/0x1a0
  folio_mark_dirty+0xb9/0x120
  unpin_user_pages_dirty_lock+0x588/0x6e0
  process_vm_rw_core.isra.0+0x7ad/0x960
  process_vm_rw+0x1c1/0x260
  __x64_sys_process_vm_writev+0xe3/0x1b0
  do_syscall_64+0xee/0x4f0
  entry_SYSCALL_64_after_hwframe+0x4b/0x53

Relevant ext4 messages:

EXT4-fs error (device loopX): ...
EXT4-fs (loopX): Delayed block allocation failed
EXT4-fs (loopX): This should not happen!
EXT4-fs (loopX): Total free blocks count 0
EXT4-fs (loopX): free_blocks=2415919104

The issue is reproducible on Linux v7.4-rc3.

The full console output and C reproducer are attached.

Best regards
