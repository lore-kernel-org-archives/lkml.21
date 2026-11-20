Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191221;
	b=DqNq8jujT8thbyhpzab+lxaW7PvW3IdvsCosfiSJrNaH1oWjUNVGfYDntPE4SWnXCP7D
	 EAMG4Vk4oHKCO39Ds+SbVxypoB072pSoo6yrv55TE9aJGWx6bhLPWpqWorKudO8bGtb3I
	 J9Hk3lWep1GghY/1B0wuTP9pUWZDJNylAlAWMdZs3ouB9CkieesQEuQHVkPJ3bWk1amkm
	 8vNE3DCoqa7EtN97DkFHEX55ZLzZHn8MD0dinxAExndDuuCK2u7LbGS7ic2YbTpo45Jyu
	 6p0R5gL0y0aTBPcx4tvgmQUBdwNYDzD8GC6uymP4oeTHS7JntCqhC2HolxE1Q3pig1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ske43Fh9A8yW85CHf4qvTL9iEMX6C/Nlv/vlJ5RihTM=;
	b=yWHvvO6f9TLV0L9NMm3kgtm7taRKC6UhFN4f8E2SOsyIGFXsk0UKJSP1f5RLJv2iD0X4
	 O7YysRXtu/N0eCQL0JOAY8eZhlsY7yumNHUs/VrnvrnSdjmJhOtwAc2RINSMAKxp/YVs/
	 cIjdQKaNwIVKmXIevjttAGEcvMbyhs3XwYZd+DuZWsdHetjoegklp8C+ZMMHpbFkULawF
	 97T235+CSHu5c5sRakAcsE1C+6lOl0A9XFJA0lGc2lS/JtQk/eUTNfwKkAccQAiNCxQYE
	 vxcikCzFP++ETjGbAaiTtEv75ENch+Iz1hLfSaNgEdsg892B/u7udyyeVD2VGH9VHRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=DVTGNfn0;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC35D60A2608
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC35D60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=DVTGNfn0
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-94961b68685so93517585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795191218; x=1795796018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ske43Fh9A8yW85CHf4qvTL9iEMX6C/Nlv/vlJ5RihTM=;
        b=DVTGNfn0RcRD8xfB+MwwKXCzdG/2IJTQQR9aTVOkOmsK3ahaMAX0zhRCFOIygzDqw9
         f3lz3ZzXi8QI3ehzyGCslUcbAG/gxV+tGhZ2KFcrn0+zcIopkJ4NNcm7Xoo7X9OmJfoL
         jVuQ3eimiXdBh2Ma/je3e2nCkdrkPLU8V5x5rwXabvZ+6TiAfOX0/74y3dTxKkn4KPzE
         bktoH0I6MrCWADpcafmc+zr6zdmWr0G6JB/wYAQMl08Glz5W8nAdMN0os9EN4/U0JaEn
         AYvjOMByY49vLrNOZiK51nREyf43nfkrxaHvZc8Iyd00OjdfpqYCqcwhg+MuZvgqpiLy
         KIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191218; x=1795796018;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ske43Fh9A8yW85CHf4qvTL9iEMX6C/Nlv/vlJ5RihTM=;
        b=f52tWchFw1XhfpdU1/BXU33QRvjjYzJes2FraxhRE2Sj1JpRKY5EG42xp+C/9qBuqS
         SemW8Ak+FhKAtBlZXVYkEsD2Cseg8WvGiSA8v9ZMfJSxNI8xWmEbJ3s/L4K6matYoE5y
         2VdUxf+eRPbN1qbbUMwTcRBg8HlLhn4qr7xNESQcke5G7UMkFgZg6JjPu69hlFddc/nz
         NpYSDFUZkLmZcr4x6ujA9pR4mGmhlI94TGxlMvqjqXXFYihuDMfN82Yd6zFSNivcER/I
         6po6vvpynTPBkTLkcVGxUnu47axCFqFeoPlaJh744kODgYgBXebu7kA5jqGSVLS0J2y3
         /Whg==
X-Forwarded-Encrypted: i=1; AL+hErGQ6yQSExmCbKI+wY3iHE/YNbA67+GqCl2izmnl6TuPfqhgNO0eXLUU2F3e1OeMdqWej7XNuWeYPpZSfgk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B7mBu5/2/RmzM6efn+DbIA791gpaUI7UWho31pN16jU/XNfVJ
	W8eXWImg/fM2xa1BLy4NYDk2w5yDr8BBsrYC3e3cMGEoPIMLyOFBPOoeG6U01cit1Q==
X-Gm-Gg: AYBFou3osCR2tyktB60iZ/P7Mfv+8JU1/byINbTJHL9bcD/fvDE9W0YuMuUTXKCR3JY
	Rae3eoIHcLRjOmu9EWf/dwnb9E5J4LyImEStdTkN3wgiWjbrJ2QQE9orvjG3J/02rpVdy5IAiaB
	cqw2f1zRTluZHvp9xjPhVJdnRM+Ca33eA8ouC0bbH8KMn3Q6gwOc9bm41EqlbWU3t5Fpl1YQdof
	ab4DA9i54Rp3rd+W2NKA9ONWr+apMkbgeOBxn/kIv12sY++2iv5BZvqjgKqCvK0XP6M4v0BZbtH
	agId1KgPfa8FA1EU1fc1T1FKcGoiVHJP3hURn6JR2xG/zmw/4VJwwQdNud0rAMyHFm9ukgtMl34
	lvs1wj/2a2CwMjNCI5G3tJOe6TQOoF7Qtsuk99EjRMtDqq0l/UD9S2HjSxiQEVloHsQDja3BJfT
	qS0i7wtai+9flB5NbpTomfVVWvEGkVKv/YgBp5hdj5l8KnXn+Ps7z8hjusgj63dCiGGUH9jws26
	oz30N8wzfXJiRthXNWWM4jNj2clvpLWEPnSs7rA5fxm+pZwN92ZlDSH+VDoSWsLUR8gR5OVxoVb
	Xm07zazWH9UeA/a8mu9tN4mSi+eYIQ==
X-Received: by 2002:a05:620a:4488:b0:949:91c6:973e with SMTP id af79cd13be357-949bab66f99mr562619185a.65.1795191217744;
        Fri, 20 Nov 2026 08:13:37 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41c105sm217536885a.39.2026.11.20.08.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:13:37 -0800 (PST)
Date: Fri, 20 Nov 2026 11:13:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shihuang Liu <shlomojune6@gmail.com>, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Alejandro Colomar <alx+linux-hardening@kernel.org>
Subject: Re: [PATCH v2 RESEND 1/6] USB: add usb_make_subpath() for formatted
 device subpaths
Message-ID: <c3579747-1dce-4444-8635-5c3e836afb6b@rowland.harvard.edu>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
 <20261022070929.20820-2-shlomojune6@gmail.com>
 <2026112032-pecan-knoll-4f4c@gregkh>
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
In-Reply-To: <2026112032-pecan-knoll-4f4c@gregkh>

On Fri, Nov 20, 2026 at 02:13:53PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Oct 22, 2026 at 03:09:24PM +0800, Shihuang Liu wrote:
> > USB drivers often build device paths by calling usb_make_path() :and
> > then appending a subpath. Several callers use the deprecated strlcat()
> > API for this.
> > 
> > In preparation for removing the deprecated strlcat() API[1], add
> > usb_make_subpath() to format the USB device path.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
> > ---
> >  include/linux/usb.h | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 1da4ad1610bca..c90ccea0cdbf6 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -14,6 +14,7 @@
> >  #include <linux/errno.h>        /* for -ENODEV */
> >  #include <linux/delay.h>	/* for mdelay() */
> >  #include <linux/interrupt.h>	/* for in_interrupt() */
> > +#include <linux/stdarg.h>	/* for va_list */
> >  #include <linux/list.h>		/* for struct list_head */
> >  #include <linux/kref.h>		/* for struct kref */
> >  #include <linux/device.h>	/* for struct device */
> > @@ -987,6 +988,34 @@ static inline int usb_make_path(struct usb_device *dev, char *buf, size_t size)
> >  	return (actual >= (int)size) ? -1 : actual;
> >  }
> >  
> > +/**
> > + * usb_make_subpath - returns a stable device path and formatted subpath
> > + * @dev: the device whose path is being constructed
> > + * @buf: where to put the string
> > + * @size: how big is "buf"?
> > + * @fmt: format string for the subpath, without the leading slash
> > + * @...: arguments for @fmt
> > + *
> > + * Return: Length of the string (> 0) or negative if size was too small.
> > + */
> > +static inline __printf(4, 5)
> > +int usb_make_subpath(struct usb_device *dev, char *buf, size_t size,
> > +		     const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list args;
> > +	int actual;
> > +
> > +	va_start(args, fmt);
> > +	vaf.fmt = fmt;
> > +	vaf.va = &args;
> > +	actual = snprintf(buf, size, "usb-%s-%s/%pV", dev->bus->bus_name,
> > +			  dev->devpath, &vaf);
> > +	va_end(args);
> > +
> > +	return (actual >= (int)size) ? -1 : actual;
> 
> -1 is not a valid error number.  Please use a real error code, AND spell
> this if statement out.

Also, why is this an inline routine?  Why not just make it a normal 
subroutine, and put it close to where it gets used?

Alan Stern
