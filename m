Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779308;
	b=pdqyvBr4FA1qs56ClkdrIYU9AQR5SY9sgkBgfMSuhcS6xj9WEuxDbf9P81zg4vMStRMV
	 XUd1SH7Mh5d2yl2XqFwSkYUI/ZCDYhdQorF1hlrjsG9DCuhb8du1k2784SwejM6nQmwOl
	 NbtOfWApcIQCJu7weNRV2RbpKh347EceM7ZvkbZLC1vQAj6g9ifNfFkYiMxUGos9vVj7l
	 o0k/OLHezEx9kG3PNeR06VvgSHJQzz4jfnBxc6BChNOgqVaFMRgvOBRIKFcpXEGylVy3L
	 68jSaeoNQM9WcMfMwhgDP32/HU2z+qL92XDHUxGtoBBtJdmQC+3/mTy2oyp/QKZW7ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779308;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=gwxtLvDET4plRiI/aFJ9pJ17JKTdeoN4pm60Amjwjqs=;
	b=W6YkuzX2lBkYgjP5FSS66LC5YF76TWitDXnDLzIVj5mL6a5ou0VWJMZYf9frK08FbR/1
	 i36Ongtmd3wHvjAx6Xxmasy2KU1yoOe3q3UlDYObHUmGsNIjhdruq+xZgnp9aMeuc9/HE
	 lOjnuY/h85lmDDlLcq7FhC4ls+x6ZCstLa+tI8ZrYEmXno22UWD1W7y1WGzkxLup7KGgD
	 8a0fHtPP//r2BU6hfIT9dTyPkOBmvD7JENBfqzhY3VpV13rOzQazl3ljAqDiwMvQCbUOk
	 HTAV8MJwkZEBIY+6K/U2EgF6QGyEg7XtPGu/izckoK0ErUJHSpdhs5IR2vawYZgVo6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB57D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB57D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5727b04b81eso4852141b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779307; x=1796384107;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gwxtLvDET4plRiI/aFJ9pJ17JKTdeoN4pm60Amjwjqs=;
        b=sXgkosqXv9PqvYK+Wie5xN+t7vgk75DsFVK0pWswOdBFmLI01KJNZEmFUJAC36bsyU
         YVez7eGwdV9pzyIcMuGG6ZcWbMG5d8VAHvgr0zK3ZraHvapC7Za5n2lMA64u+Rto9CNI
         ezW+KzFYnWmdMP1iYSayP6QtjNeWbnhfAtmyG5eDgHap5CvARILEb+QawFJ+Kc+dq6av
         pTVyrS/IefVVZpeiwsKJaDswJ1lS2XBm/JoWIpW+f/pQPXLQCktebIr4J8chyV/+/ogl
         1Ciz2vbOhGe6JCSglwHRIKIxelidCFbLCq1q+O6OxPpFama1qd6MDvUwPyK0BOwvbXRd
         mPhA==
X-Forwarded-Encrypted: i=1; AL+hErEp9aApFM1+OT0zyiS+DXpsKlidlB/OCre3Tf5qGumxa3/nppUuN2TS9SrFNyouctyh9qg5gmiTOgSFv6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tPg6ntJigMEvzTz5L3Rrh2MtBNGW6uYCke0xRLHIROCBkSmKa
	AAjXVnnNr839auKTe35sgo1u4OX+qRND/YyGTM7Gv9lRta+sS7rKP80MF5s4WdqA06y4eXr4TGD
	jYgH1uESSps4/6JsTVgnINPoLuyUWza6Wbnn/Ragvy7f1ea2zsNYCxzJloK4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a4:b0:577:2888:47b2 with SMTP id
 5614622812f47-57a0a1094acmr26038852b6e.22.1795779306844; Fri, 27 Nov 2026
 03:35:06 -0800 (PST)
Date: Fri, 27 Nov 2026 03:35:06 -0800
In-Reply-To: <20261127113459.743859-1-deepak.os.system@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b096aea.b83081fb.4cb0e.0022.GAE@google.com>
Subject: Re: [PATCH] dm snapshot: fix double vfree in alloc_area() error path
From: syzbot <syzbot+1eda626824b6334f5ad3@syzkaller.appspotmail.com>
To: deepak.os.system@gmail.com
Cc: deepak.os.system@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> If alloc_area() fails to allocate ps->zero_area or ps->header_area, it
> frees the previously allocated buffers without resetting ps->area and
> ps->zero_area to NULL. When snapshot_ctr() subsequently cleans up via
> dm_exception_store_destroy() -> persistent_dtr() -> free_area(), those
> dangling pointers are passed to vfree() a second time, triggering a
> WARNING in mm/vmalloc.c ("Trying to vfree() nonexistent vm area").
>
> Reset ps->zero_area and ps->area to NULL after freeing them in
> alloc_area()'s error path.
>
> Fixes: 61578dcd3faf ("dm snapshot: fix header corruption race on invalidation")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+1eda626824b6334f5ad3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=1eda626824b6334f5ad3
> Signed-off-by: Deepak Pandey <deepak.os.system@gmail.com>
> ---
>  drivers/md/dm-snap-persistent.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/md/dm-snap-persistent.c b/drivers/md/dm-snap-persistent.c
> index b587ee733056..9f5ade4f51ce 100644
> --- a/drivers/md/dm-snap-persistent.c
> +++ b/drivers/md/dm-snap-persistent.c
> @@ -194,9 +194,11 @@ static int alloc_area(struct pstore *ps)
>  
>  err_header_area:
>  	vfree(ps->zero_area);
> +	ps->zero_area = NULL;
>  
>  err_zero_area:
>  	vfree(ps->area);
> +	ps->area = NULL;
>  
>  err_area:
>  	return r;
> -- 
> 2.56.1
>
