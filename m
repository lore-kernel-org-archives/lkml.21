Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186874;
	b=3D9NIKur+fLycXLd98Z0gCbB2CkN66kHZt+mBjKba1Xcq/vviUJ9f4xK5/IvHc2re2cc
	 p9gEtbGv6a3vwyv5JAoIRYrkM2CAXto9HEgOSxbBjXGocQ2jMi45HICqEbGp6TEz8c8PO
	 5QL2sNq0+JZFp+9Ok2y3fp8kdjJ2MvhNsYVzXv8Ujd+bLYFH1bprywAca32DiccmeEfH5
	 97Oen1hgLa3HNTiLdclj9vlKQybVRzHufrCB6S4vFk5Hvcdwa12ZhfoDnWyIcXqx9Vj4p
	 +9e4aH3dJ8s0I4g8/4sbJd8e4bomYwQGduvB8xJwGRjBz3VnbyKCf8uveH8w9yxOxHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bUXTcWB2gCAchh7a7jLoo9myOcXMnzJqVzVHJAOHy7Y=;
	b=RNBTj+kmbL1N6NiOcRd+ePgOBMJYWx6zPgfvIMXi3TFC0JrhRZ05wjAckQD+ATIVgBqe
	 k+qis1OMsJ0SDjsKBCPWe6/gDXhAiTCwIbJCSerovB3J2ohH3JSsj8uz2i+jiob5g3aTX
	 OjZXLO9QW3iYaB3/sAfh936b4KsvlXJGxuMFXqCqaSsODs4n3L/QENicKCI+V7WQSU1x7
	 U/N09kRCadL9YICkpjkY//yDWS9Cpmdz1iIhNtNJDJVdkqvmjg16a4I7WbXDgaUozbWBE
	 U8ScUUK5oprCv1c2CpVOCoCGSQeYXGrw5he2l4hGqdhziYfcrcOGEBi5ERqfzES6hJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="q/876PqC";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB5E60A2619
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB5E60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q/876PqC
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so604401a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186874; x=1795791674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bUXTcWB2gCAchh7a7jLoo9myOcXMnzJqVzVHJAOHy7Y=;
        b=q/876PqCgLYg6tbOv1L4VfzQwB4XKk6YHc8mfdeFLsL9+h3VRZOktn7UEeU3ZaREoh
         Hb3uJN1RoTBHw/D97uK55OMHsY/wL4bSOIqZ6aELTKUAyQ7oXjzgMDILpd64vNt6iAfF
         CJNy6rNyIq1/00W1ExqDuhMNb9G0VYhEpT8S25B01H+c6csmZc5/Vt3Y+JgFGl6mP2Cu
         JE9Fw6tqlyzuNcg7MnrqfSP3vAlE2NjuANuSVpg/cMYetY5RlHzhuZhg70Rygt8FXL7I
         Hns05w27Jj8nTy7+6t2IBjjDTtmlIyixFwdjeswnu/0R5ccN5//dYv0qd9Occ673oOjZ
         KiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186874; x=1795791674;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUXTcWB2gCAchh7a7jLoo9myOcXMnzJqVzVHJAOHy7Y=;
        b=is4qUpmasMurn23YkMsAHXxDxya7DFSagXrQhhwPD6lidlGKE3igTEm3BVbsC0wkBZ
         s8wDdfrj0an96A3WOzuiIH5MhzxkYh3Rrb9bjdLOc2HqyyKY+3SE58lD2/hG7oY5KEXW
         trlFiZ/U7yKJ79t89KDklv/a8ltSi+Yy8gwzxUd2P2NaRi8WF0rY+oOMc6HGV8SL8ADb
         hKeEIaonOcF5gvfvjmetYdKHJJU+nCIIEEbcrCk1JYmHscby77WEK7yRgX55ywx2NoO5
         NNoSWz9BpRbETc5sBl+3O7+zdWDRknSqGrJILwufyLKL8X+xmQYTn1JChPCxKSpaGRgk
         A0tw==
X-Forwarded-Encrypted: i=1; AL+hErGbhf0BE6J9HPBhjrc1aZG49NnzY0DSyRisB4L6lZGWq7uh8C97ZyG8Wn5lm8LWxNsIJkqNggaiK4F9Uwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Dw27ZIslQuLsUycZwDSl3NUxdKsA89hwX5qCJ+XP34O5MuMm9
	NsGWjn4xaNnN9AA5dV/SbAR+uebT7FM3m3N0MEaMjsXVJGFM8mfbcPTwp515Yh+fTg0=
X-Gm-Gg: AZFdTZdNcJomKxJJkrKs0PySwfCjJZNJ1MZhCH/QAWAjhs/fTkPO/rupFTenM4QD7iM
	6QBCSoNYxBIGtFoycMNts4gQ25sed1suEEhxNlCkPAbxzHg0ZZ9f8C9LOH56Vh0dibvPzs+Nq1J
	7mGpG/OlQuFEUYykCWW622I9vGxsKMD+K/bfWC8rA2Y0ci+P78lbiY3za6WuGN1cqkXlXg7qhBQ
	UcodOux71ByPV8RBULUtpO8XbuIJPxUe4n/cKbzr8350MvvA8y154YLtn9aBMRGs6vnPLb9CdaO
	d/hh/bwPRqPpLsavP/g8oufQQabEjqD2HBzbWmuaZCzEu+LYYlusARzQk/RylBnz21DxwRHOpGP
	nEhf87crCMazKwAVGUSkoQs4avfoOHEHxRLosnTe6djXkp4ww7U4r6axvZ66k5pImlMAIX/q5fC
	HYYd4YTeo6T+R8oJ0R8M0V9FSwkqP4W5uX4XsHfARDNSKP1ucRdXy9CXOanSKomYLr5A3z3MhpZ
	Ole+CHjO0hzRJLV3qnfmg79BWx5/yM02vwdm/VAuL9JKd/WF061Xj8ePowbtufA2f0RYGj2NgV9
	rveOdF9UOtAM3spqGPfncA+b1eEaloG3Pfp/U7x74rAx1nB2MhS8vvKxuTq1uB9CPDR7kwxV/Zo
	5Ps8ASsMFWqso3UqTgczbGRFlQTu74HNufnKGVUS8MXZN+UcGYFmPXwkVUg==
X-Received: by 2002:a17:90b:1801:b0:3b3:ffa8:6bc5 with SMTP id 98e67ed59e1d1-3b41c9823cemr3026706a91.60.1795186873588;
        Fri, 20 Nov 2026 07:01:13 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm7768016a91.1.2026.11.20.07.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:13 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ram.vegesna@broadcom.com
Cc: dwagner@suse.de,
	mkp@kernel.org,
	jsmart2021@gmail.com,
	hare@suse.de,
	michael.christie@oracle.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: elx: efct: hold a node reference across asynchronous session setup
Date: Sat, 21 Nov 2026 00:01:08 +0900
Message-ID: <20261120150108.3128312-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022209.2580332-1-yhlee@isslab.korea.ac.kr>
References: <20261021022209.2580332-1-yhlee@isslab.korea.ac.kr>
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

On Wed, Oct 21, 2026 at 11:22:09AM +0900, Yehyeong Lee wrote:
> efct_scsi_new_initiator() hands a bare struct efc_node pointer to lio_wq
> and returns EFC_SCSI_CALL_ASYNC, so the node state machine keeps running
> while efct_lio_setup_session() is still queued. The work item then
> dereferences that pointer on both sides of a sleeping call.
> efct_get_vport_tpg() reads node->nport before target_setup_session(),
> efct_session_cb() reads it from inside that call, and node->tgt_node is

This is superseded by v3:
  https://lore.kernel.org/all/20261021142818.2782104-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
