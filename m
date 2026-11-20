Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186740;
	b=UdppwlqK0YslSy61KhTi/CXsvj1MhfHs2MzY+dScipUKWLXDrhtn+nEMs9PdMk06NC6L
	 I2f2LhVuSyczquBnxPSUkqmIdjiV1gb7aqcKbh2IW6Q5lFWy0wVUbDcYraggU+G1Qr0Kc
	 yR3CBVFvvfg6tsTy52DpikLAqdgzPW7hsb0+7OeQwEjUyySMHgJVyWxTk9b+ZpwPWGA4E
	 165Xn7U+9Lofhsg3+E4TaFa9eiogqD2RI+VkkUnzPTC0EisHm3ekgN9Xfcg998C8rj28X
	 xfbey8dkiiFlPdlSWDK7WvHbImVxcO7BAANqCuK2GrormbtttDU6qPFCi8xMcuIw5Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gyAlktB7/fvxFToJv8yuwHqZuGY8e6CjhpJsJYAmqqk=;
	b=4v1V8X+lBzN3JLGz5+C13BMmWoFUjKH8OSD030xNmRiDyOHY1uEq5kgQAZl3vUaMpzeV
	 GDxjT5wDTyPV064MoOVad7c5oMiYp0V57AqsWgXcuCcnJPdr9NhUCr8+Qp75vdowi4bfJ
	 Ofml576+q8g4D5e/GVj414SOSkM5ShjkIh5yYDizq4Q6VYYF4IohHRgYNB5qb/8TYqC8M
	 FiMw+v3d5FbGrPyOIEXVglHuXrbsFxY9QfNMY3IAi2teq/PZNHfXm4lGr1ZpqBf8HnIY+
	 bjSvkp8OWWIuDnvCzzR98+ZkifgJQnR2tbVxUk7Sq9FPfvFv9IcSupMBQmCq2ET6i+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mRBWabp6;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A55606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A55606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mRBWabp6
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1290909a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186739; x=1795791539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gyAlktB7/fvxFToJv8yuwHqZuGY8e6CjhpJsJYAmqqk=;
        b=mRBWabp6oMqL1dds0wmPm0MhcAQATeIZm8hf9Rb8W10qwDNwC4BTkNn24qnQckAhiW
         QfEiDf2Xri7GViDajDiBXY+8Y2K43m9dKB6kaUELm0kahb7BH5lU+K9/JCFpWP0Cb7tO
         6JWS6t4/6mCOgniGbjuTKrVht3a1GwYcJ1f5dvODJx492Q8Nnv8Ra/gjg5t35O6UizlE
         pHr28Sa6JkDmHfE8Oknv6vrwKr20ZK4HRS2BpJD52xLi/satqZZnPUPRtWav/JHb93+V
         bOd7itUBXNPtRqaWi0kkxc0oAB4IeqXhTE8AL/w72/duyx0dT4mVe3HoXwdw1ZPltmmU
         UaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186739; x=1795791539;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyAlktB7/fvxFToJv8yuwHqZuGY8e6CjhpJsJYAmqqk=;
        b=TeVGvIeTpRSF5dzAwvNJXwOXkvVIxxkahwN35nM7k9yVjXO5q5gSEdrCgjt5Ujl6Ft
         EQhp3crnJoTbeZIzQPH+/Lr2LxMQM0F/vdgrs7KNrd/EqWIjZg0CeY2wMaffS0H6RBCO
         HQUTZqTs3Cley1xbjKPQRwI2UQanlqZABp4ZlTgJYU2xchBWd7YFotGouMEFoWQsq7bF
         oXgn9rXB8zH1XCQuhYhHspPJ3D/A6kUFjhWzqmiR7FQwUIoiNcPHaETR37cojddJNQ6v
         w/wVj3Zp3c4EymOAMl/6q+lQc3qWP8xQnKVNv3V1XObdK7HqGJDiPXCFWjTy0bHOHnCl
         yZig==
X-Forwarded-Encrypted: i=1; AL+hErExcOh4yGW+kthsTQRwHpMu7I7veXtRL3ms6KFkJCOH8e/cvQ2wCBUVEP74uNYnjPiHXoGUrA+646Gv+ew=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YfX62zLQGs6r/aGAv695xZ21Ac3NoVwb6x9HkW9AClMp4QapV
	f1kTXM2MV/8FBUcaVsLT/EBVQkrWaaFuUeuRpXtdlIX0U/gefGDrq9NwM2sXHJKBsu4=
X-Gm-Gg: AZFdTZcE3+7WicIs4YFStIzDtNnhs1Hrzed/RG3/cnDm9wyD33/2A7l7lVaknWHmR6B
	lzagtXBbANIm1Uel5NVd04iXbDBJahAAMepgrLtb7CcVnpUPtG+3rTEE3njwjxjSiyXm2sGpaQc
	rq5pKGZsKTa+hEb5XdIuRgCLPAIdoYPg+lQK4pqwUl//6Pr2tdvep0tMpmySHeVmHgHBxXB3Rol
	WZ4E4spV1iJpG3jnx3WG/Fo71ir4pgiAeepncs1EaQ3LI6rsGQLoNvefticcCno8cj/FUQjQCkU
	GZTUw/ExIyFXk47VJ1k2By+l92PJew5v5mPsKsbqXsvVoZRN/SLByYqomsTAk5fDGVqS8vSFwxX
	CbUPkvv9pSQogsZX7j84gGay5T3uRwz6yXzpbqKsrJpY50Z6dbm/fFduzAAUn9NusNh/bjS0wh1
	UV/XCGuOz5oLnRJ78nv0OJb095Ech4MHbfq1x0iM7Zr3pCMGpEY9ey3U8sQsLR3GyZQxo9/tm90
	lQ1NZmkRwmiwmXM4TmwR4ba4HUZSDZgUwqptOIFIzs2VKL4Zho+DhIfxWQcEPpovEN/WQsETR1b
	L7dxpvKkkpF2kn40TlP/lIvbWfBdlf8P9wG5XgPkmjdiNtufgh8Y7fshsByObZ/37iSMkOlwtNy
	cJf7TAiA5u9kXs4UbhuRXxCj0dgwU87HM9otC
X-Received: by 2002:a17:90b:388b:b0:3b3:b8dc:5e0b with SMTP id 98e67ed59e1d1-3b40a5a4cffmr3841142a91.14.1795186738957;
        Fri, 20 Nov 2026 06:58:58 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe976csm1336540a12.11.2026.11.20.06.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:58:58 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com
Cc: martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] scsi: libiscsi_tcp: check that a read got the data the target claimed
Date: Fri, 20 Nov 2026 23:58:53 +0900
Message-ID: <20261120145853.3127796-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007044204.650687-1-yhlee@isslab.korea.ac.kr>
References: <20261007044204.650687-1-yhlee@isslab.korea.ac.kr>
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

On Wed, Oct 07, 2026 at 01:42:04PM +0900, Yehyeong Lee wrote:
> A target can finish a read without sending the data.  iscsi_tcp_data_in()
> bounds each Data-In PDU against the command buffer but never adds them up,
> so a completion that declares no underflow is believed and the command
> ends with DID_OK.  The pages keep whatever they held.

This is superseded by v7:
  https://lore.kernel.org/all/20261008063248.767676-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
