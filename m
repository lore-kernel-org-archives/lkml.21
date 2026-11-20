Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214287;
	b=vUq3dmUQvLofmbpquSGVU0WAMP2tD97EYuMGCZP2h+XtUXCuUjsB/JNBGZj7B2qmIRVJ
	 YstIJLSaH94VwSdsjdj7R1lpNbDw3z16KlZAntYn+85kjBwCvn6IKUp5s56buDm5Qebc6
	 C7aFYHXU0T0rGcgPGOVPJ1vSfgKSEMqw4VUmbQ1eRpGlNpWZNg3CiMm7U9lreVcvF6cIV
	 ldtedUhLxkFiWgST7QBgq29f1HvxYemubC/ks3JH3CDkXm3ZzSep+MGNzyVaUrToJUDei
	 kYUl8MteW+bQZzbPzZ5cVPzUwHZLzRUoCX1ijhnL8Q7+UmwSUV3rm5UywHGWsyV0vDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vt5ZGvfMRc1ZCLFXNMdzQcTFlp9fnIFCArIgKZ1EHbg=;
	b=sRURqJ7yuKCZDEaAMpDQEZ/TxX/Jzr/Lv5w786KA6u/PE+GAAP5a70bcGlB1Ax7HHcfd
	 d7+svvl/LTAcLl8J//MmF0mKuoKmCM6NZ+2Z8EZzzjSQJ71t3AdydXxicXRE9iVB4WuKg
	 V0okRXgYsYgIdmwSapqCQfBxSdrYRc2aZi2uWJV+zeDQPNBprJphpIJAaG2wYfoojWMOG
	 INHYGWa8RehrBgFOcTGjy1T3CVwLiSQzXXK3XCiq+V5f956SlDvzp8oKkI7LwQe+wB3uS
	 2aO7AHZB6EEmHIRH4yCoClWEGbW/cG8SrpHohVWxcLElajtyx6Sb17ndcKbu6yRZkmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=UU0LUqxH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09319606A699
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09319606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=UU0LUqxH
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2893531bso815392a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795214283; cv=none;
        d=google.com; s=arc-20260327;
        b=K+iFedk3wncC48u7RZDfFEnhMsBr+rqTgPXLwob5oJpczLHacdiiNHg9F7aduskk+M
         lQguhcviPho2rp/FSEEldoHy2Nc/3k+j6fGICksaDkUP4p6urydBQLoPixNTFw0am9Ay
         lnhU0sBe/S++wdlu1Y6qQ0WIbyfWkgAJ6imUX1Khpq/RRyzOddpz0prJTYN2drCN/I2s
         0rl/Xa6+1b+Hrr7kWsfi1x5JI+I4qhFx+mp4fnDUgkHRTKPQr9ImAKPi1oxvAoRW/VuH
         9+6con7+vA0rk5u3yW22bTyzMqrJP14mWcOQFMeQvaVz+YG6cBBHdB2DglQ4WDofVy7T
         2zCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vt5ZGvfMRc1ZCLFXNMdzQcTFlp9fnIFCArIgKZ1EHbg=;
        fh=RbzP3M0wAxUz5SXfaMqqI1IrCi5pj8YSXY1LWMB8r5Y=;
        b=CgPz3rjtonBGNx6cWHcU/v4y/UPhDRrPaOEJ2ELeQJMvMnrRTeA3qxKw1DtKgjBtKv
         F2ndkVkRZyZkA8Y64vumUuboUCOM+cV68eVx/ZeL5w/OBY/Li5Y3HuP80rLMEn0oGH33
         UgU+1Uz1N2j7gJR4q/+HFIPOm0jf55VEsQexNMcqqyf1XJobGCx1aCxMqFXqdN4Cymab
         FibZUnABW9PZsrT9x6fA0Md3LyARpnazVgVemmZIrwJj+CeAVGCWxpwH5wxNv1zjYVv+
         R89kKViO3wRaaYYh8BC2A2OaGbMts6a4+pnSeuKTLpMeOp+k8Mw+I7H7yk2rbtIn1cE6
         tAuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795214283; x=1795819083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vt5ZGvfMRc1ZCLFXNMdzQcTFlp9fnIFCArIgKZ1EHbg=;
        b=UU0LUqxHXfMjVJD/noqvHuNbSrWN0j8s3FChpwWgKZ5LWdVlRsnkfEnBO9gla0UG5t
         8RZ5MMsn6ymrvW4dheE1upSxSUXgxv6w1+Jf+xV9ZRhmEEFuWYY2h4FllaXODZQAPTvl
         Oz6vcbQ34Cytlftik01DiW7F9Sp6lmlNexxJpBmjbQJ8fH7vimFc9Frs0Zn6e8jxRLuT
         wORY3lMtxgHpXfGMXo8eFDXTdCzR+pmPgG50HkFfBZt0RqEF7QA6e5eEsoGPHaJiJqWi
         4z4F2y0YDuOi0AJEG8g0p/XyH8QDZO41xCpJgIO+1Kp/KtrZPPgolmWnvBC5n++E/PKr
         ww1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795214283; x=1795819083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vt5ZGvfMRc1ZCLFXNMdzQcTFlp9fnIFCArIgKZ1EHbg=;
        b=mtgHcjEph7PK+eypJc0aVDRm5LLd8wLviAxcE297G3m3yDc8Ku1GAHa0UoxEwc3xOu
         Ww1qYZP4XAmLwUvecSxR/JhRsjyRKi1o+tZC8TmeNBDG+Q/MIyDf0Q+q8JWwbAmjT5bb
         e3Q4nqIyJ8rDUd53H8+h8zarBX/ejqy7s7KK13JN7FuUt8T/tIVTubv+DAoSF/fYtDpC
         Os0w4vluXkDVrZ5O6m+abvMTy6k7xviolsSg0kjFuue5w113AJq5ydaknBbQJ7pUBfDf
         vUKSbX16XFph/VfPsbtgd5JKe472rQ5V7oAmHvfbq4uxtvZhGjw1E8e0bgv9tsO5vF0P
         H3BQ==
X-Forwarded-Encrypted: i=1; AL+hErEWft5uZUP5CmCHhDeQOLvci/8TSO2TcV34IE18LGKrJl+j9aW9wtlZjd7nLJgzeRiFDAebbBt3rb8FazQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z86O/vFDWN7pfQaoO7obFekuSQEyVRWUoLN4LNjID2bFxXiuQlg
	bQ9O2/WDAFL0g2UK0j05ivA/ZnVS8hUQBuDNR8Gvsagdk45OVC8gz8OQI/0C19uVNqfPYQPuVQr
	iqk5YRK9QHx242Cs1jXZVMHH9HegAGm3KH9QaxR7L
X-Gm-Gg: AYBFou00/CZjG78VFBxV2jcKzaMVRHxJptIlxG1SLXUsBKDgB93GdTgMFZS6J8/I1Dd
	G/0C1u1ldxxJPPrpkjZk70YqHO9brD2gV99JK9GhYF62v68Anc+vn4Nfh8WjTfKbBHjg44YVYaC
	MA6y+WXJG3FWPDh3m6nO94KDv4qYLhzv4K0YqAQQQ+mVjKTZB1/4rk6I7ZiQ4ubR+q9ICNarGEp
	tmoUICTnH01fgBSJajINCjYP22IbSDtZqs/ZVDX2q875KEw/E6ilHPD58YW5NkJFCM1VHL1LV2S
	O4XyrxF8WVr/0gecnoL66eKSalp8JhP7duQwz3JbxhxERfQRXQv9xc9HybHV4hZ9YWauogA7skn
	yGzV7VLaFGRD83R4+Qm8aIZC6REZDZnxp0taG/AMIOR1pcPN2j/6iuXPhyHthPN3AWqvC
X-Received: by 2002:a05:6a21:4cc7:b0:3de:463c:7fce with SMTP id
 adf61e73a8af0-4014c25017bmr4994159637.12.1795214283378; Fri, 20 Nov 2026
 14:38:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114052900.7-1-bbnpreetsingh@gmail.com> <awCgjAHgzJi5Wn4+@hallyn.com>
In-Reply-To: <awCgjAHgzJi5Wn4+@hallyn.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 20 Nov 2026 17:37:51 -0500
X-Gm-Features: AclHuK-j_JdQdrpVjapZq8oYMEFZEHkdHRQJ9XZMWAuZkPPeP92Jrma4Sd1E1oQ
Message-ID: <CAHC9VhQkAt0G9nHBeFJnuOkGg1_z9mzpUZRcy3uM+f=jmP10dw@mail.gmail.com>
Subject: Re: [PATCH v2] cred: annotate data race on non_rcu when copying a cred
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Babanpreet Singh <bbnpreetsingh@gmail.com>, Serge Hallyn <sergeh@kernel.org>, 
	Bradley Morgan <brads@mainlining.org>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+ee58b040032d8bed63d9@syzkaller.appspotmail.com, 
	syzbot+557fdc985d6ac3831e14@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:33=E2=80=AFPM Serge E. Hallyn <serge@hallyn.com> =
wrote:
> On Sat, Nov 14, 2026 at 05:29:00AM +0000, Babanpreet Singh wrote:
> > prepare_creds() copies the current cred while another task can be in
> > get_cred() on it, clearing non_rcu. KCSAN reports:
> >
> >   BUG: KCSAN: data-race in io_prep_async_work / prepare_creds
> >
> >   write to 0xffff8881046cea68 of 4 bytes by task 3646 on cpu 1:
> >    get_cred_many include/linux/cred.h:222 [inline]
> >    get_cred include/linux/cred.h:238 [inline]
> >    io_prep_async_work+0x9b/0x3c0 io_uring/io_uring.c:367
> >
> >   read to 0xffff8881046ce9c0 of 184 bytes by task 3645 on cpu 0:
> >    prepare_creds+0x71/0x550 kernel/cred.c:192
> >
> > The race is harmless. non_rcu and usage are the only fields that change
> > on a published cred, and both are reset on the new cred right after the
> > copy.
> >
> > Annotate the copy with data_race(). prepare_kernel_cred() makes the
> > same copy, so annotate it too and switch it to memcpy() to match.
> >
> > Reported-by: syzbot+ee58b040032d8bed63d9@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Dee58b040032d8bed63d9
> > Reported-by: syzbot+557fdc985d6ac3831e14@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D557fdc985d6ac3831e14
> > Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
>
> Reviewed-by: Serge Hallyn <serge@hallyn.com>
>
> At the moment this seems correct.
>
> I do worry that if struct cred changes/evolves, then this solution
> may mask newly introduced regressions.  But I don't have a better
> idea.  I mean, I guess we could keep usage at front and nonrcu at
> back, and memcpy just the parts in between...  In a clearly
> named new helper function that wouldn't be so bad, e.g.
>
> static inline void cred_memcpy(new, old), and let cred_mempy do
> the offset and size calculation.

The __randomize_layout annotation will likely make that tricky.

Alternatively we could have a private dup_creds() function which would
copy over the individual non-pointer fields through direct assignment
as opposed to a memcpy(), skipping the rcu and usage fields of course.
It's in that awkward number of fields where it is somewhat practical,
but it would be fairly ugly.  I do wonder what the difference would be
from a performance / compiled-code perspective; if it is slower it is
probably a non-starter.

--=20
paul-moore.com
