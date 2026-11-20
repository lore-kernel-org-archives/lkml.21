Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192795;
	b=1jnC8h4THbOYsVogBGcTbno/L03aNJMew3GthLOycNTV89QYxG5Kb39VfCVG5ugClbkz
	 elzYj2C2pyJy4CiEYdE3GB0w74DY0P9cav/879r/A8Ly9hOgiKCDpxP9QSp/HhbQ9sOIF
	 UR/sI/UWEfUgL+Vp5c2Jirjd8aMGGhzcRzb+mcBUsgIWQAzZVJyw86P/TrzT4OaoVDHTw
	 QpF1ftcS83+/rN/VGPqSy37Tw33Pgv8WJNS7RlfBG6ArojC7jsxE1tvK1puWlf8csN2Uh
	 SBmwMguwpoF7xCI1rOxq9Q3K1JeZpzD5ReFnYR0PgY+8QbHRkpQ1OZjeyAlaVO/HvZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=X7CKRTq2Up5l+f6XzAeKjlVv2VDwIKbHcnq42YBLBPQ=;
	b=qrg9PcxemwfS9XwJScLAEyMbGZVRNLCsxo1qTUcFKM4Nz0sj9+SBOJPnSYj52CSXIF18
	 Zlv82WoLbcAxv53/n7+0ybcHAOxNiW5mZydGeln8YtzxrRb/MvjSCJv/Culj6CLEEhTLq
	 G4A/LWLMRUvhV7R/zBo+pVmwrsh8cASxhxAAcgHUM2VOyGDkjfvFyjBnFLnuuayp/dxNv
	 8Ef2Hm8T7I4ae7UwImNUacXdUoHQBve0hzvybG5o22TUX1wKqUFfMMMiHb06XCKU4rv/C
	 JHOfCfvJabaElYovL0IrXs56vr2vINVr+pmjYS5gT2Onj+3NrFKoFZ7i7KKpNkLFkEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nJJxJhL6;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A0060A2607
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A0060A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nJJxJhL6
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9ae391a05so7187325ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795192794; x=1795797594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7CKRTq2Up5l+f6XzAeKjlVv2VDwIKbHcnq42YBLBPQ=;
        b=nJJxJhL6n2ctqodT4EO+rNssng5pzWJwvOdKOT/lwdgUYaCFmKn01hkVOK9LNnVgDf
         UdE4GFf4WjDHjSz5Uy/tidBzhiYC7xOhiwWXWpxNd+TSwuSXkX9GUlbtSBlmeMBP38l5
         6tPP+0WujmTqCfnRhc2ujdjHZjP+nBzdu9Q2HzEqBv/sADyLKk7AJZ+uFiqyBtwv6N7f
         1tByluOfG4UN+R3dbNJUbvPF0EXO117JGSiU53rmtTyYPynX8wYmcCl2CvF1pq7eyHfb
         Er5fRjfW4z4T0lhLe6rEs4/MmQXXyguIHys6HloYfyUTv4j0SCVWDaB/FwRfZvetyFzC
         qEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192794; x=1795797594;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7CKRTq2Up5l+f6XzAeKjlVv2VDwIKbHcnq42YBLBPQ=;
        b=DEtfximekXIy0fYTNMrxCoQ9YCWfTWnw5yZNG0la9+MW9z6kpgAIy8fTH+Pajawcyn
         0/8QLeGvfmKyuLkT5Or9i+qLaJeu/c6o+jfob5WD8A9kRclMK0I8bVt4lDQLRMM5U6SU
         fn0xMQhh9FdB6iuQ17sxSOaZSQvmSBIGMe9s4UsZaSzUCepz+1SQfat3uWVqq/juiOzG
         ISwy6ygaZ3EQ3Lbcu0Q4B5bdsjzrsvYOTNXjKXcvgRjxj+t29rYp+RArgsN6YMXnr/iF
         RSE0ssb8yPIVclUTH5NNw7ehED0zR89bfgiPvWvQ7Es4Tx6kjPhniabuDQIQgB1liX6C
         ccxg==
X-Forwarded-Encrypted: i=1; AL+hErF3GAfXXBh4PcF6d/toGOw2Jz495mCitREjScb5PA4R4X3EhB7+no/qxDKiS5dWY2CQ+UdNmJkAo10lmfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nNxrH2T/NOD9ujyjAgWO1ainl332WY45A05MoFLsDhj3u2x/R
	9lKiu63Tbcq7iElwxz2yYkpoEOGvwjPH6GQ0mdxnAViGFAgtYjLIe8Oct63ednUZ+BKkatowuKG
	8DvYqhQw=
X-Gm-Gg: AZFdTZf3lSOuzXlAYLOE6FMjNvIeE6xjE4B2e57O8MRdE2KZ1sqX4MXeueur71MNgO2
	I5PItmlI+2qaqF3pCc9Nb0svw/C2MsaunbooNMb1+pFwomKRHCI/FSXUFvkQdMY90PreqcR5J1n
	UhOXvplhET9ZLR9J3Mp3r5TGhfVpuuW7vyeWBvuZXIj3rTVsh22wIsUhjq1TRv3bYotgjraLUWM
	7ZEqRezoKNQmAD2ibWr/1mYWhT2yQn7jnxK7XuybGWq/aOrIej/GOvz2KR77bcYoc/M3/n0Ua/E
	5vC4XWTEKmGRxKiwa2UWf0XmaOAEzuIvBwb1lLFW5Bx+YDrnNhvEtrecKyZFRqoduqWHcSqJ994
	mt3a2VyHbglQdJ1nvdkalEbVgN5GoNXHzvT0uL5PN4fu0Yy+uKFEAUVwkb3XDhbbzBidDfvEWuZ
	LvPjEA/fxubTJHuAC+iI7VRJXSbJazU1Dko6qShu5nb2WNmigqzqLT5eiK5MMEXjdcpN+kbPn5a
	02uyCT68q0lkCW+ni1se0jYOXDEwiEhnwXaVrvFRxgu7vw9/Du7w9Uubq0R4eEymIDWxkvasRmG
	5Wr84LApEMaxuhBSYOrIn7iqSP3vQCl0Nk2OvgIil4KwEZydoCBEZAZgPUqoRoM4ujgT4IW/ohN
	8wauHfGZWpI7M224YYYTlrFRqgwuhi/G1YIz6
X-Received: by 2002:a17:902:e847:b0:2ee:1c36:e25 with SMTP id d9443c01a7336-2f03f211940mr28621045ad.35.1795192793950;
        Fri, 20 Nov 2026 08:39:53 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm16865065ad.75.2026.11.20.08.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:39:53 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Lee Duncan <lduncan@suse.com>,
	Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] scsi: libiscsi_tcp: hold back_lock across the copy of a Data-In
Date: Sat, 21 Nov 2026 01:39:48 +0900
Message-ID: <20261120163948.3238659-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-225445@kernel.org>
References: <20261120145243.3124991-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-225445@kernel.org>
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
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 03:15:55PM +0000, sashiko-bot@kernel.org wrote:
> Should iscsi_tcp_hdr_dissect() verify that task->state ==
> ISCSI_TASK_RUNNING before accepting a Data-In header and setting
> tcp_conn->in.datain_task?
>
> iscsi_itt_to_ctask() only checks task->sc and session->age, so it also
> returns newly queued commands in ISCSI_TASK_PENDING on conn->cmdqueue.

It already does, in the series this patch follows up on: 3/4 makes
iscsi_itt_to_ctask() return NULL for ISCSI_TASK_PENDING and
ISCSI_TASK_FREE, and 4/4 adds the task->state != ISCSI_TASK_RUNNING test
to the ISCSI_OP_SCSI_DATA_IN arm of iscsi_tcp_hdr_dissect().  Against
plain mainline the PENDING case is real, but it predates this patch.

  https://lore.kernel.org/r/20261117101500.1894608-4-yhlee@isslab.korea.ac.kr
  https://lore.kernel.org/r/20261117101500.1894608-5-yhlee@isslab.korea.ac.kr

> Can dropping session->back_lock before segment->done() let
> iscsi_tcp_process_data_in() complete a newly queued command that reuses
> the freed ITT slot?
[...]
> digests are enabled, iscsi_tcp_segment_splice_digest() sets
> segment->sg = NULL before receiving the 4-byte digest, so a subsequent skb
> carrying the digest skips the if (segment->sg) check and reaches
> segment->done() after the task was already freed.

No.  iscsi_tcp_process_data_in() never touches segment->sg: it verifies
the digest and, for ISCSI_FLAG_DATA_STATUS, calls iscsi_complete_pdu(),
which takes back_lock itself and completes through __iscsi_complete_pdu()
like any other PDU; a task in ISCSI_TASK_PENDING is refused there by 3/4.
That a target can send status for an ITT whose command has been
transmitted is not new.  The digest path is the same answer: after the
splice, segment->data is the four-byte digest buffer, so the copy that
skips the test goes nowhere near the scatterlist.

> Does unlocking session->back_lock at skb_done leave segment->sg_mapped
> mapped with kmap_atomic()?
[...]
> spin_lock_bh(&session->back_lock) while inside kmap_atomic() /
> pagefault_disable() (which violates sleeping spinlock rules on
> CONFIG_PREEMPT_RT).

Not a problem, on either half.  On CONFIG_PREEMPT_RT kmap_atomic() does
migrate_disable() and pagefault_disable() rather than preempt_disable()
(include/linux/highmem-internal.h), so a spinlock_t may be taken under
it.  And a mapping of a page that has since been freed is not
dereferenced: the next skb hits the segment->sg test first, finds
datain_task gone and fails the connection before any copy, and
iscsi_sw_tcp_recv_data() tears the mapping down once tcp_read_sock()
returns.

> Does the conditional locking across copy_locked trigger a Clang
> -Wthread-safety-analysis warning when CONFIG_WARN_CONTEXT_ANALYSIS=y?

Correct, three of them, fixed in v2.  clang 23.1.6 with
CONFIG_WARN_CONTEXT_ANALYSIS=y gives one "spinlock
'conn->session->back_lock' is not held on every path through here" and
two "releasing spinlock 'conn->session->back_lock' that was not held" on
v1.  v2 moves the copy into a helper so the lock is taken and released on
one path, and the file builds clean.

  https://lore.kernel.org/all/20261120163857.3238489-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
