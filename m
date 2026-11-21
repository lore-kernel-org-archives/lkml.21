Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795255716;
	b=yo55WZFXYFDmhYjEV+WkS5sMRuJtCh6tvAuo/0/RyBG2f94t4LINEdAHHmSCgPsceK9g
	 mo9lOlBiTx9n0bctIenREfJCXbgzxkMheFrtHahtO38eRAULrMZ2mkLpwm4EpqE4L0MVx
	 oj75iNAs6O6x0aokSrnRMVS1Vzs52jFDew7EQGsLXI5KyB8LFMmzzH6MrMGMoCisXGIka
	 jD9NaFzWzTdLMMji6vXcVFzb7I8M1jQueVLI2cDgoJSkGoyiB6gz+06pka1Pnz3gDmTFc
	 t/5fPTQxt0yeqRH3NvGhCMNfOml2p8NHcD566wzp+EU0wP3Zs0LHTHAKBtzJaDTNsnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795255716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M3bV9m2HMGmaCwO2iKbHIS6yi+cpxYoMn1NsouoZxXQ=;
	b=xJp2gc0Hi/+z5RxaFRj48chhzCDtIEphcwm2nQ3vImv/Pb82vv/iHq/omk57Hg9QYz7/
	 uDd+Hh7otVRSBqcTEP/EzJpkM0pMLzzcdQLP1W5NN+MlmVtooM4/lvmsS1jFBLcCHXjSz
	 K69HO2Kz3RHOYY9RzhUTJcf8RAs0e1yAlQgWNa2Vhm3zGQ3jLtXGKH7XfpfTsbFOqwvAE
	 hb293IUvdwgHhAaIL3BHaISlEUIiCj5K7dmJWEUlyQzvCRO1PtSMPb9FXQTjADB+DF3dO
	 t09s9EXEyAsZebiwW/K+WKHOlV4U+EWPp50kfrOVjkkV3nJBi4dfQoiF3AToWnCZ8KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIjejmKx;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84714606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84714606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIjejmKx
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so13165605e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795255715; x=1795860515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3bV9m2HMGmaCwO2iKbHIS6yi+cpxYoMn1NsouoZxXQ=;
        b=vIjejmKx+awfWvtxbaiVdjBrjmiWjacQOxqPsZUI0CqGCDW0fuIiZRQXVDudTZGOTR
         gju5da9tDZjUyLhePRxMGltOIhPeBE99/TXalHSZJxFwMd2nSXfj/NxgATCe0LqtdlUl
         zckXDAqUVxmrB6H3i/aAMoJt1OqMT1zQ4QELOVm5EJMHsQHN6XIozmQwDAcFpaTGe1FJ
         kzBgVYJr/RM5r+BgnefB75i+A+nbhCubEQMkKMT+c012le4aDcLPSP1Tv3b/eFsVO8YK
         BrQMgijnUDiONQ99FXmLVxrum8UhLJCHLtkwN18C5zeOB1xqLvThyeguoPisJgItezGP
         A4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795255715; x=1795860515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M3bV9m2HMGmaCwO2iKbHIS6yi+cpxYoMn1NsouoZxXQ=;
        b=pBD2//leqnR23OQUfPh+6HH/qCe97mPjrRs5IG3La4rzamEDTbtEJW3tflLAOJn3ZX
         b0T9IiDWbVX71wAyuL20wdeW7E6eC0PRI+iQQr8TAQ9CSCqv3IhDJWgbcJ8sckRzXztZ
         nD+eaE9jSwyJ2i3qXV+OOtG+W+aKtztXKTJ9nBwEaX/iSKYQyEPsNFgziE/S5nQGBVVz
         bsuZrSFYwEvpg29lkDagvJ9h97w7sCyZYHViUAEwa/0429EDq78dDZgYSWq6RGyor9pr
         19WgWJM+46wSbpgL6T828OcaGQDKTfSQxnscwuGyWXRVSYrlWjSPPao11RnUDAMEbxwG
         qLrQ==
X-Forwarded-Encrypted: i=1; AL+hErH/RoqPSNuuXHyL2OsNfpByjslrEMVrcWHxcD/UrA4Xjefdm4qDm0tf+bTI3nny7CjAigxw+5UCeyO1xIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SHyfxguWlWTXxxoNoCY8XF/TsChbCep5GUkZr+xoE/B8CyeqW
	7+oUkJVMEIa3qWGAQhuDwBpAVtkS4UoB2XBGV9UU9Qp9xVKzqm2NwgWwAQ3+xA==
X-Gm-Gg: AZFdTZdvKbgctS7CRGQtorA3Dq+4I/r7szAG6Yx0l8me+TuenCxAFogFgWySzrWk9XG
	anrBEGuWzrHksdi2QFpNjpKyY+cRz+4/ypzS8fd6qRrH2LLmlirR4UPanKBi+wJgn6KhUClZRWP
	JyQQprZwOamWthdHmPHSNWKglRJV9/VFPRldroapmkvrfKLN9B2bqL7/+X6lPm01nt68sFFcEWD
	m2bSWD0Pvs6efIBgQJaS1Sk0eaG75HnTQqiEdoXkl2kYOyWwgVcggtiPKKxQoiayMjDzIuhmpnx
	mPghPD2blbjGqvZJsMemdR9dfiD5zSXc+velqqo/dSU2tz0DkClB4/70wGty8tHzsr/t5XFVJ+G
	YV3xNMIopGK+/x9lRk0Cm+k/QkIu/Xn+ay5nPRYiIlbmoAjpeaeUdutpLFGq8TrsLa+Gnjsyy5w
	rjnKVkHqxxwwQ+GqolQTraWOwjwlFAV3wtdVzXWGKLQuqncSt48xg0MvpwmAuhD6nhAs70xYD0i
	Fjllv7Gwm2MdbndP/ddfjpvrbn+IdazQ6BGjIoD9yaHLq+OyJQEEJFTIqQGofJiYHKwSTyRjfS8
	vqvmAQD+7ezCekZD91CmCiw7A7Q3SdhUKaXm8HFEX9Ga3760jPB8bSW69d+6ctxkOLRNxcofVg/
	Hqt2Ge0Njzcg5fF23drUTBufNRlFFSIUnHLAnYRupUiQPFs1s5ns=
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr128310005e9.22.1795255714723;
        Sat, 21 Nov 2026 02:08:34 -0800 (PST)
Received: from DESKTOP-IR7J1S9.localdomain ([197.118.31.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm44631505e9.2.2026.11.21.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:08:34 -0800 (PST)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: linux-security-module@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v2] lsm: don't call d_path() when current->fs is NULL
Date: Sat, 21 Nov 2026 11:08:32 +0100
Message-ID: <20261121100832.499-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <481c20b898f003247763475ef417c321@paul-moore.com>
References: <481c20b898f003247763475ef417c321@paul-moore.com>
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

Hello Paul,
Thanks for the reply,

>  static void audit_log_lsm_path(ab, inode, path)
>  {
>    if (current->fs)
>      audit_log_d_path(...);
>    else if (inode)
>      audit_log_lsm_inode(ab, inode)
>    else
>      audit_log_format(ab, " path=?");
>  }

I got your intention in your v1's reply, but i think that changes the current behaviour,
if current->fs is not NULL, then this would only log path, without inode, whereas current
code for example here:

case LSM_AUDIT_DATA_PATH: {
	struct inode *inode;

	audit_log_d_path(ab, " path=", &a->u.path);

	inode = d_backing_inode(a->u.path.dentry);
	if (inode) {
		audit_log_format(ab, " dev=");
		audit_log_untrustedstring(ab, inode->i_sb->s_id);
		audit_log_format(ab, " ino=%llu", inode->i_ino);
	}
	break;
}

if path is logged, and most probably also inode, and your suggested change only logs one of them,
Is that intentional, or am i not getting something right?
In either case, i would happily send v3 with suggested change.

Cordially,
