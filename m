Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795002784;
	b=VIO9Qdi9Yk2CJ44o7MVsgku6IgR0usGNHmEkdYcTI7G5ntKFxjL0gRZqtuS2nKeMV0vB
	 arzz9PWMMLx1oo+wv2JLDZ5/UyjTSiZlSrRfFuYHcWRy2sEViAvwIJeXPxXDeygs9qbDb
	 BBrREuOP7yDLgvNQrTkBUASpkof4A+2/T2ywYFwGM+AwOMScHjwSNBhfdlb7To1yph+//
	 mH8S4FT4+MixROMngU6hX/vltM0xgGujZyR6lcfVj64fDTnrk3E/xed54j1jAnaU1gY9C
	 BRgl1y1TWN3kCFbf2B6SSkNc9euRTBp/JG/LY9i7NFj7Py1IXvmSrqZjXOcmPLbyCgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YOemy4vy8MWHVR40UGX19+QReF1uG2SByZYvNpsd4oA=;
	b=GeYUklsP5G60Ihm+tbKFdGelQW0OPnpq5F4SfhjOeDlh37BcRp8IjgqXOSBhAiaiv783
	 qHn0gDcgL0ZgQoZcy7oQpLUZ+OSjqdNfZJvTMlvNfTGRecv+Tx6bE9aeboIHSBxY1IHKp
	 jDAYRWleta/j13OaSu3JYohaZCm1RQCNpfkroFRq4Q450dITDYgP1dAS8TDaS5E2AhPOi
	 eHXKAThg00QRvaNn2c1oMJ3RVkybCAERDdo3bT/wh4inFpXVOk63nx0sWGdWT8pWFRUkV
	 fqrD3vr4ObuygI3I3cCXzbUzlSkTib36wOHPkt6jXhi/fxgrvuKpgOw0z2wFfDzZmnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=WQuSux+g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B75C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B75C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=WQuSux+g
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55ade1de0b4so8814441cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:53:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795002782; cv=none;
        d=google.com; s=arc-20260327;
        b=cSH7gJAYQA7t6r2qN0wZsCATiOQDGFt91OKkxrwx+45wH50N/72yLcFFtgZbZgvm6r
         4TT9R/8v1DUVXSfqEBmNwZQFSCFH8fKZTirIe82xSmaMaU85OntBxvOQ5xm7VCQkNTUJ
         RrnVAFjwczcSzv6+knEIj16KqCKRA2Rd9KQ/rSvDY4DiYjty0mznxN+pg0B2okLr2SZ7
         76XN4WXSfhhiAvGGZQRaGK2lg9p4X9m4BVCdzTz6bz93OuhorQLA1+5EnWf+Yi066Hru
         KOQOlqteXAKkO2jBBRIts7dmoave1ATqbodTF3Z6v4c/rBNdegkO4Q4SQOsJGBoG5S/q
         td4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOemy4vy8MWHVR40UGX19+QReF1uG2SByZYvNpsd4oA=;
        fh=qdhoKhNAgLY6kEfb2FbvDyG2N09pvs3RRIj+Su7equc=;
        b=A83SKDlAjUUlYuRK9SrgjQIXAArrYCbjPKcifTcqpg2PDVqa6eAqTmTZNUX1W1xA0Y
         voroba3zcFG8Fq2CUS7ZLezufmZEsSkEPQVU/AUPlk9PjW0ZHqaTdEJye8f/yxldhgDZ
         aIt0l4oQsF7wpygcc9tLHj8rIFChhqYa6hpDegnFfv1efrVxyrbhN3ub4DprJ6FGNobz
         NI7kY49yx6Nbs7pSZZrvDPHLPzbpZPp4PGV2UQnNP3+mCMm6UZeCPPG7AnL2FpLBvs3w
         4chW3vbxXCS7yvuKH26kAc0so2pRRtcPiRo7HHp2KW7/3++Zf08A4yqBf17+goHeObTU
         WsAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1795002782; x=1795607582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOemy4vy8MWHVR40UGX19+QReF1uG2SByZYvNpsd4oA=;
        b=WQuSux+geT4BihdtfnZi6446nTgtD5+9/isM5YP/X7fHClnPhiELyMYopCdszDNrhC
         7DBSN+dE6I3Y/8FsMUI9jWhoYTSzo0ufLcPJvvLOA8f5NdRthvfmtSXFhmu+5pyle2om
         7XRHXksLJr7ad1Ufey0e7N20tYHCH8oXQVhLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002782; x=1795607582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOemy4vy8MWHVR40UGX19+QReF1uG2SByZYvNpsd4oA=;
        b=zMHqcxOl2/jtMzFWq+TKF5lUjL1MyJMTsfdeqKdC0E6jLEVRXg11AT3lAs0sySAfnw
         Pr4f6Fl4WelTigZgmL+tilGdPfYGgiO+WwiLMEDQ57e9K27Wl0eHiXT4YUEisl7a3M11
         T4dmpToWC4c+mf5EoZlqJCipCrLNTzUWohRNodw21fhOV336bjk7/S5cCUNuySqunW+9
         gaC87micWl1Z0xjxmnN4MnTELXwSHYCDgHgx+Nj+1HjKBAhaubLaP4/vh/7VdF/d8jcE
         tBs1++iJhwU2SDqC98VwsJsrutTLL5xNprBvistRIG2BudMZqmn7ElEzvagCr2o5yltx
         7dsg==
X-Forwarded-Encrypted: i=1; AL+hErEYFP5TXXWgAx2HqdAVSwTp+lMEl4MBMVspFPLvXR5anhIGu5km48YGDS6AzG2iLNjH0ElC8IoZzF7ZDqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fOZQ1lCWI6GazYlFDSYxmsxi4GwzTdqLYL2d2VxoUdZ0WO22X
	ztvfD7Yqsr65HY+lNv2zQuKDeHQdgTdloU0a0B6dTtHj7tDcORXDiKyX9VBbnia4apObqQqXuNZ
	KhuFsYmhWUVpFBvpckeIArH4YBuCwG3RRBK2I1x3J8g==
X-Gm-Gg: AYBFou3oMtegtBduOkQ2P+OAKcPP3gHcFJKL5xBTZLMrQ1cdBqZTDigkE8sCnbRg0jw
	YdCIsSPGAnE/V1L9SUdpkIDLspqBsKHA6yFszF3jy/oKwnvct87SE7lBK3608+eyrCXWrp/nY7J
	HMg6p+7nchTwOMHtoiaJJTqu3IW+DfO6Gx1/6pPmcIFUNtdClFpUpoWEU94LolkwoDQ71jRRgmf
	a5aHXTcPY6NuAVtiwdU1s/fyGr+uAkycHwn4gtDc91wJtm4pu9JYTHcVmVsLJ2lgXZusiYJLlE2
	OqecGVxD19RNY1gtiVxyDT2qvufjafQjev5FaCzU+4BpM450MiMgx08Rpu/GOEVVgbdfSrZP1Gn
	fWnAcbzbW5XqNtWiEeNT7pvvULDO0riEi1PxLwcbUH4jutGwH5bOYuFXTL4pobjPeNUVUwecPr9
	PM7lDTYw+GDAE=
X-Received: by 2002:a05:622a:1b9e:b0:55d:2d44:9ae5 with SMTP id
 d75a77b69052e-55d5a5543e6mr34027371cf.18.1795002781647; Wed, 18 Nov 2026
 03:53:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260903132636.1113789-1-cui.tao@linux.dev> <CAOQ4uxg6_0wnzBmA+-rZeADBTKwLsWFdEM5ZVGa6YvWX6mAGXA@mail.gmail.com>
In-Reply-To: <CAOQ4uxg6_0wnzBmA+-rZeADBTKwLsWFdEM5ZVGa6YvWX6mAGXA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 18 Nov 2026 12:52:49 +0100
X-Gm-Features: AclHuK-v802KVD0LHoWjY5iM0tjQ6zHZvpD7dHxxWrixnWgNNbm10gK44m_ypRE
Message-ID: <CAJfpegsfjfEamq5=+0Pu0+E2EFRzf5Yk7iSp9-z4kved9jNjLQ@mail.gmail.com>
Subject: Re: [PATCH v2] overlayfs.rst: clarify the scope of file locks taken
 through the overlay
To: Amir Goldstein <amir73il@gmail.com>
Cc: Tao Cui <cui.tao@linux.dev>, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	brauner@kernel.org, jlayton@kernel.org, Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Sept 2026 at 15:51, Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Thu, Sep 3, 2026 at 3:26=E2=80=AFPM Tao Cui <cui.tao@linux.dev> wrote:

> > +Note that file locks and leases taken on files through the overlay
> > +mount only provide mutual exclusion between tasks that access the
> > +files through the same overlay mount, and a lease taken through the
> > +overlay is broken by opens through that overlay.  They do not
> > +conflict with locks taken on the same files by anything that changes
> > +the underlying filesystems directly, so file locking cannot be relied
> > +on for mutual exclusion between overlay users and such direct
> > +changes.

Locks: completely agree.

Leases: independence on overlay and backing is not guaranteed, as open
and read/write/etc. may trigger an open on the real file, which checks
for conflicting leases.

Thanks,
Miklos
