Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195920;
	b=CoyKF+XhyncDIIPsJWQssEmDB1BqLvH70vED2btnoxau2Nr/0R946MvnUw2JK/8opdjo
	 iBRUchMlWC8BQfmuM7GJZI3BzcR2o0KS+4guuI0tvJLyJZo0QFaTFnp6Hw0ETVOm8Yval
	 rZX/94ge5Z2IUIPCKa1/ZakkALeAf6TXWGOUASveT96rR968JBKEZxesfOUuuRVB74dmH
	 Ki46QdxTXgzKYOQZtv1pAzy7iyq+K6QE2Lk6653ZNRD+WKUaqeA7nF8pkiBrdS+5eF1uK
	 HU81TwCe7fPDYjxqhZurFQqsb/X97z8V9Dl0fV8VLSCy56OCJzOmIVdlAirMA+FBT3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1lx0wfNVXkVLhymhPDkbH3mU8AtjMWYu6LBXWtj8f/4=;
	b=B/IlT770I6DXGSAt0sZ8BKmfoq+DhMf2w6tUaqD2XxHsTauef9vx9BsLCjjBST7zF76i
	 QO+f0P3StPsHZ5cM3tKnCdWZDqKgyYXVGK3enO7wnoAF0JPIncF3ZeTtAgVZ5raBiExhc
	 xUE5XOHTK5QBFlgKem2RNufJvqRTQxoweBc5yHE/i0HWzrnbu3jEyFfTkpICQKT0+jCKo
	 xpQZehHQnlfGoyG2kyz8zRM0Un/gVotyzQHmXpGXQQAO/uQfyEeCeDo9WQr4pglwYBdmN
	 FZdNw4hWH8jEbb201XlQMtLQPyj64/Ft6E1b3dt+OVttZ3i4czO1uymsVb5EO5Ai39A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b0qxGouI;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F0D606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F0D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b0qxGouI
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f037bc348dso10628655ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195919; x=1795800719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1lx0wfNVXkVLhymhPDkbH3mU8AtjMWYu6LBXWtj8f/4=;
        b=b0qxGouI01Q7g58R9t1IKaNFoPtO5CPrzo1lzGcWMit8lN+PlOZCcryx7ToHCut/Og
         H8Su3OtrxNac4NOe/NofEMPOJOEhfuQ9ksjjiMPYoJtxdnF9MKbQvFddZld2c5Ee9lHu
         AUUl9SR1pUXuANVSqZG6XSfl92xkn0sGw6TljNfzh4QWDygXXwWxTu0CCM61s/EZOWTl
         btScX3GWFRVcXzTepMj0/TA6bYmRt8W+7Gn0+yefjQ8Nn4xyMz98arTq4a3OdQ9MFfzo
         UE8ZRMxSBD1ZBKJ9wVB4pQJG/XfiQBP2l3zjAL9jKClf9yiMOFzuyc6ybmZSHZD22Roz
         qBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195919; x=1795800719;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lx0wfNVXkVLhymhPDkbH3mU8AtjMWYu6LBXWtj8f/4=;
        b=dfHVjX98thpcmMgPPYQzB9xG9zEbu+9UpMxnDhp1KtFsMrFkJwF6daRwz/WErL8rpb
         hzz+v70hoGjQOt/5wJWc0YHN7zWC2jZ5PD2DMS/BwI1r3EnQsryuYmoQsAFuXYa5YFMX
         Drog6VYRA/mcpHQ2x4bbiCph60pFf7xW6qcoqmZtcPM/29YyTdmiwWPdMcQbeeQ86Zsd
         x/fYsqyPBkuEadfj/SxDmLLitoppCjUdnR5ui8VL+W/JyQCOJpkY68zMHJIVoZZmJ//O
         BIcDBZrcDzjsjO1cx5uN2s6Y0eHKqSGZKnjagCIchSIgNGTzUcoGVDtYYwTOB1cTHlcP
         Mu1A==
X-Forwarded-Encrypted: i=1; AL+hErFaZT4xKECQskG0vkIIwEbbQ1oNgf4/5IvI2t70qr7oopd+gCTuyVKV1z5rBQ9s+lIS/ErdqK3e4R0sPNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y8/9/vkWe74RkUQQwi5WywRE7RegNaENZz6Owz+99EJgL3lVg
	kg8hkJjHKAuehSWRlHWDxCRTmHgwnim22rw2uscYg1/1l5cVTxG/3u1yjZBFBS0wwe4=
X-Gm-Gg: AZFdTZclezBtOcm8PhnED0sxE+tYVyt2UMVK3nP1a/ec2djgPSR9gqfC5EsL0c/L4z3
	B+FZQQ841pNCmIozXJDgTaF1t5UjbU1a+9zbQZl4iEnGc2F+EHTJgzQzk2765RguXf/IHOVcvHw
	xzxRdfHAtcrNUVIAFPuMbC5Pes16ELCK+rEW6LGxMOWodpn+mIoOHglIf296FFCohbPZWmYWNI2
	Wv3mTlBF1RucFvyHucQvtmiOTgQTMmgpoCQWePOxHcqFQVrBgBPK2fBJlNx7qVFgNMGqZmjczMI
	zh3rNL2PSanQrf5wcd58pDJMDU7u022v0eCsaNCDgkJDTmdLKOfBpXs4hhtsSL50j7dKbAuYMwE
	1LSY81/KqqsImTX82fRk/3LrDheBlv/eJoVYJKK4TRqq4cmPZIaOuPlIrZK5ZscGp9bp6qUTyxC
	pj0ianphNFPEbB0AWuXwHTQxQ+rULGGTKwG5OY5MK6vRb4p/WBYK7jeQPkLe2WaT7OveZ+A8nMG
	0sv9YDS26VxsNL0ZZgVd+1kZ73AKZqUIrXXP38Tcu0S6n3kJE4NKcpvf92hGIP4jVSGripNb6Vy
	+efbH9dZgaePLqgo3hMJ/9gxHmoKXbYz805hudFVvqffXlERHpYUjM+JkSuLs4LvbH/MUzqrooH
	tkDekOyEuJX+X8WzykutsU91hQpobzREAYhiX
X-Received: by 2002:a17:902:f642:b0:2ef:da10:bea3 with SMTP id d9443c01a7336-2f03f1cf4c1mr41222865ad.11.1795195919434;
        Fri, 20 Nov 2026 09:31:59 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04eaffad5sm7422655ad.14.2026.11.20.09.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:31:59 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Lee Duncan <lduncan@suse.com>,
	Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2] scsi: libiscsi_tcp: hold back_lock across the copy of a Data-In
Date: Sat, 21 Nov 2026 02:31:54 +0900
Message-ID: <20261120173154.3286585-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-225621@kernel.org>
References: <20261120163857.3238489-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-225621@kernel.org>
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

On Fri, Nov 20, 2026 at 05:04:52PM +0000, sashiko-bot@kernel.org wrote:
> Can iscsi_tcp_hdr_dissect() aim tcp_conn->in.datain_task and
> tcp_conn->in.segment at a task that is not in ISCSI_TASK_RUNNING?
>
> In this tree, neither iscsi_itt_to_ctask() nor iscsi_tcp_hdr_dissect()
> checks task->state == ISCSI_TASK_RUNNING.

Same answer as on v1: this follows up on the v4 series, where 3/4 makes
iscsi_itt_to_ctask() refuse ISCSI_TASK_PENDING and ISCSI_TASK_FREE and
4/4 tests ISCSI_TASK_RUNNING in the Data-In arm.  On plain mainline the
PENDING case predates this patch.

> If the pending task on cxgbi is
> instead aborted or failed before cxgbi_conn_alloc_pdu() sets
> tcp_task->dd_data, cxgbi_cleanup_task() returns early without calling
> iscsi_tcp_cleanup_task(), leaving tcp_conn->in.datain_task dangling

That needs datain_task to point at a task that never went through
cxgbi_conn_alloc_pdu().  With the series above only a running task gets
there, and a task is marked running only after iscsi_prep_scsi_cmd_pdu()
has called ->alloc_pdu(), so cxgbi_cleanup_task() does reach
iscsi_tcp_cleanup_task() for it.

> Can dropping session->back_lock before segment->done() let
> iscsi_tcp_process_data_in() complete an aborted or reused task in the
> same slot?

Not something this patch changes.  iscsi_tcp_process_data_in() does not
touch the scatterlist, digest case included, and a status that races
with the error handler failing the same task behaves as it did before
this patch.  Answered in more detail on v1:
  https://lore.kernel.org/all/20261120163948.3238659-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
