Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526488;
	b=ME4yWRkltkPyu4dcBJ6zJa1tUeOSp/RQxencwcFdw4xqVWhYrLvdxUj0mxETVtFFiDbh
	 6ROtuu1gISRlFey1GKokBQzsghEqH0losQUYwdyjz+NnjP0jSb2IOkCTb8Hv+NjkppAUB
	 /S3M89T8OD0HTc6bwvkDkWX2J8/1tIWtkZS66ASPJngn9B5MJiCeZKg2ab4+ZJEAzWqlx
	 Tj5PLoV3LoxSTI93RygIjUYSDFSuv7QdMIZuoI0FpjniiYghEK1I/LExbg7DgE5q3+5J3
	 7HMsXcT5EPomi8TZPEvAubjfCYIruC7wdW60ew96Fib6oPEl+h3eTQUMWVwoFJFv1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=d/UbTX7w9C8C4q6IDHL7EUYQeNfUj43LN0srGzDRwwY=;
	b=lOQBguqW9zEMHihD81KzLNj44GiRXDFJvP9fdbbc8ZxgA0fckfIMIcSNQjlWhEhHdEAU
	 bEeqx6ElibXLnc4HGx9racb1Kz1rYlNsPyIRgFimrMHrCJF+9p7K+XL9BEN7BlXBSrljU
	 sDsbSn4a5nqYdZ2pekcyiE5a+Bbc4ZyXSKUQo41agXs+sb25bujC5bQzrm/7plZ24d1gd
	 3Q3hVEksw3Ob5Gg4qWQ1k9/NUeOH6zsyo9uOx8DSGfnheeqmsNM+jkzQAmV2IgIU7rb/R
	 Qtg9oMZS328ryzIcKV9jLycE6bEew/fl7gW7ZmBL40mMQLxcb2sPy4f3x0S5pBuWpmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvcxKqla;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89113606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89113606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XvcxKqla
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so2651694eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526488; x=1796131288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/UbTX7w9C8C4q6IDHL7EUYQeNfUj43LN0srGzDRwwY=;
        b=XvcxKqlae6rQZb59KPpFV5YLGR70gyFPY48rh1RzIKbEyaErkfTXemu/MDTTzbaQ8o
         Ixwmrb/GH0ErSFy/pErx00T5h6fhw40tDi2OJbPd+cVNdImCNCnMCX4rA89z4fwP2xQB
         34O5HlTVLfJHOTSnqIjia1QXaA+7+eqeqEHAlVK1BTozBY/mvbpzJEqVAB1pNQ4pRrUw
         7eTzTDy23OULQpNDeQjAXZh18RS3ICXm0b9IoVnOkw5cna3B5IPqr5o7cUpi3w5tSF2m
         a8nc2qJv3R+yoM2AW5lxyS17edKvB8uVP6jWW/x1vQOKiAazbKq7n0LXafexG4zfbmid
         s6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526488; x=1796131288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/UbTX7w9C8C4q6IDHL7EUYQeNfUj43LN0srGzDRwwY=;
        b=C4tlSTU0xRiILWfAF0Y3Ds0rpDtScYyMM9l9YrJ173Aeh1XVNuvgGuidiqKiOXgT8q
         QW55iwW5ovHo7LPVbHKeSoeWltNulFhcpRNGx/vqCboPfs/LOCN1ciVFWhHAHUldMBNX
         q/A2u3H7jNUlV9V2y0MoQYuEDQezCVWFcGrD+e5G4c8H9/x1AMHa/4L0xiIhVmqpeUHd
         cJXTqAsO7rD3fhD/g5YtnYLUKD2rKlB4XiM8d2+6O0Ey9TKma0NxEGlrdxfzAA+Vh5d2
         7JFYsq5HunmUt2KDol0urjXIlJUtcdJehIVD6i7to+OQ6/sI9NTU6/WxgYiZHt/Kt5B4
         Hq9A==
X-Forwarded-Encrypted: i=1; AL+hErHPqp8f5V3bJYjliY8dVXim5UD3V0jSwbSe4RP5dA/IhiCyCC+egzi3RM8zgZPyJtEVR28bPyc/jFHobZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UXLXkyjif7OWrDLk28YumT8R9IpkBUrPciw5Dqilgih2lEyv3
	PXhBhL3xNH4yCWlEFd+5+RR9mhBz3Yb089c4UggHPHYmF2AuHPFLgGnK
X-Gm-Gg: AZFdTZfdJvMYJBUWkLWSsnl6lzzXSOxFXLZ9HumL7rhxMMJcUWfPuuoutPnpmvLBOtP
	rdVZvuPvr+xDoehntvoEwA+yZ41M5Zkzgek1jYQi9eR8unrBRL0sSnlnsnOvi9/1QA5ahc+N3/E
	Mv9mWQvanIwke5dLXP7vyYWFiN9lbAdpuVsxoELMfL/M6dehfZtlLEcdYSKEi2kPF2LMJy2876g
	DsOWyC8pcBd82kwl0st4R2J2LX/CEgtIKahYMd6Oxz6C8owxpSsn5r3KCerXh4LgFjRWdM0aoRK
	/vbWYkBGvXn8RAZ7VgXXYt+ZdODg/tdn8gfzad/D+XXTy8IeOZ7fE8vbwahW67FkJMn+0ZKyV6W
	Q/XbytZcE/iKCQxkLS3Gc5QXoc3IEKohdtw7buuT38/pBmgGOgoJpCxciL4OxYhIcAGuQk+AWMz
	/G78VM6IXYqavYE6ObC+nu/sTxFlxENZPFxXxqO9yQ6Mr/5znl8kWOZPNCVOLwGxweBfUGm6Z7E
	J7iFD2EbkqryM+qLogU9VltuuXLYNUuAjpdQzilb1CxUYPJYyJEuHFHTIXsvVMPF5oKKD66Izvw
	lPjzVmk72C+dR4MQlUAQyyXKDa2/pjqFuA==
X-Received: by 2002:a05:7301:c016:b0:386:5adb:ac01 with SMTP id 5a478bee46e88-3865adbb1aemr14694694eec.24.1795526487360;
        Tue, 24 Nov 2026 05:21:27 -0800 (PST)
Received: from user ([2405:201:c052:b00b:9fbc:e0b0:e020:ae3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm47392736eec.28.2026.11.24.05.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:21:26 -0800 (PST)
Date: Tue, 24 Nov 2026 18:50:57 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: michael.christie@oracle.com, nab@linux-iscsi.org, mkp@kernel.org,
	leitao@debian.org, skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+a9efa71b884a23e74153@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_tcm: avoid NULL dereference in
 usbg_make_tpg()
Message-ID: <awWPORzewOifCGde@user>
References: <20260915080523.15979-1-pavankumaryalagada@gmail.com>
 <2026112001-emptiness-rewrap-28ef@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026112001-emptiness-rewrap-28ef@gregkh>

On Fri, Nov 20, 2026 at 11:59:11AM +0100, Greg KH wrote:
> On Tue, Sep 15, 2026 at 01:35:23PM +0530, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > usbg_make_tpg() can race with creation of USB gadget function
> > instance. tcm_alloc_inst() adds the function instance to
> > tpg_instances before configfs links the item to its parent group.
> > 
> > As a result, usbg_make_tpg() can find the instance while its
> > ci_group is still NULL. Passing this item to
> > configfs_depend_item_unlocked() then causes a NULL pointer
> > dereference.
> > 
> > Verify that ci_group is set before calling configfs_depend_item_unlocked()
> > and fail TPG creation if the item has not been linked yet.
> > 
> > keep this validation in f_tcm instead of changing the configfs API to
> > accept unlinked items.
> > 
> > Reported-by: syzbot+a9efa71b884a23e74153@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=a9efa71b884a23e74153
> > Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> > Changes in v2:
> >  - Move the NULL check from configfs to f_tcm.
> >  - Restore configfs_depend_item_unlocked() to its original behaviour
> > 
> > v1: https://lore.kernel.org/all/20260914094426.25595-1-pavankumaryalagada@gmail.com/T/
> > ---
> >  drivers/usb/gadget/function/f_tcm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
> > index 9e6d4f39900a..2c2cf1164edf 100644
> > --- a/drivers/usb/gadget/function/f_tcm.c
> > +++ b/drivers/usb/gadget/function/f_tcm.c
> > @@ -1682,6 +1682,9 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
> >  		if (!try_module_get(opts->dependent))
> >  			goto unlock_inst;
> >  	} else {
> > +		if (!READ_ONCE(opts->func_inst.group.cg_item.ci_group))
> > +			goto unlock_inst;
> 
> Why READ_ONCE()?

I used READ_ONCE() because ci_group is updated concurrently in configfs's
link_obj() without holding tpg_instances_lock.

However, since link_obj() assigns ci_group with a plain write rather than
WRITE_ONCE(), READ_ONCE() isn't needed here. I will drop it and use a plain
NULL check in v3.

Thanks,
Pavan

> 
