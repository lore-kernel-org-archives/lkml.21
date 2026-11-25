Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635957;
	b=YLfQ4UwUFaIAM9KE6ScUyb7ZoSn3KcrFn3g2Hv/G7wJUb5ZUTQxH38S/19PoXurFghYt
	 BdrVdizYqqIku7smOKSebJBQJ4rFer0qN6gLp52jLnnjaTVj+DFW4ezEZbyLH6lcAo+qB
	 XM39qd8D5aNiMFkW+Bd/rKqTEkvTzfrcdDcNHMB4LbgHHkudmiUNZXDdtRljbv0CseiuS
	 sWdzgReyImQ8uuKGjge31/3XZJvkiMFpRXsB9edmcb9JLBu9Mj6SeTwi5KKYIYmnjBIJ/
	 EmGcjSJSvL4hi3Tp6qDV6XmMBLup32qG+FxIrSPR0SENFUDfZXPMmatq6mdCajgFnhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gN36yXC9t1L82OyL4V7Kkk1VfbmOXABwZZN8OF/RkD0=;
	b=BWCyrHilhUQhB2bd/kAk7sStQNuEMNp43+C80U+vXr+pzS+HU3nLzOKBMnO2L53VdKzP
	 Y30zaYoquFkFqIJSoftmRmUg+g+S6IF7cXWJO4xUN/XmOq+44zRKPx1pw910nDGqSbtOg
	 ScggZqtyOP4jTuZ3wn9R4pe9n769zdVBLcQvhFNAlY6PCf9QRNKaWGMcxiydW5PQPHPpp
	 QUjuh++Lc3/F/JsZL+MDrM7s6hEEEU8IHVDJo1UEq5M0eIVr3r4HmJ1vCpMP+/LBxQKVH
	 RpIQXnzoVUPi0nnUmlYm21PsIzH53cX7pCT/5ALsQLASC5znOc6ImWdOhpSPIEcji7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l37Jeii8;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484C2606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 484C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l37Jeii8
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8253bc5a613so3898640a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635956; x=1796240756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gN36yXC9t1L82OyL4V7Kkk1VfbmOXABwZZN8OF/RkD0=;
        b=l37Jeii8hr3JIOIE/y9Ejae7NqogQx5AXBsiGyZWb3o/m89XpsDxi9S5z+W/Of8rrH
         DcrLA8rtIp0mFzLXqovTkuuGvzmqBu2tKpiQI6JF/qcbeH7xHzdkljPa7Qzhmh8NJp9U
         FlOl5J6qkOeiurcSNaXMbCJntdXe/paVG59MNEd+sE5nQvb70ySF6bn0UBHpDcrC4jrO
         5T7g2JqUTx2Nx9i06oqxlkcad+5HoUWXMEgcLj1i0UlmMoODs17G29TwCEt8CPY856Md
         DWlyYDpes5Tn4+Stcorld2Tgllc8h+SQZ3olnptFT45YdiQe1BcJXlKcVdJS82D6kV6R
         fxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635956; x=1796240756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gN36yXC9t1L82OyL4V7Kkk1VfbmOXABwZZN8OF/RkD0=;
        b=zVKw3QpMrBY83ce93Xl79rjZfCb/hWRcOsEhkQR22pug/B4C5+z3Xg3RG4DgrEsunu
         25LoOayp4RDyLkSKSlco9X5At+nbEguJ49qB+mDDceVSJZrJQ46vlHM09hEh9z2jrdOg
         bHkiDynCbfJh/uYUo4caNP+CKaQQ213Eq9tmGeNffiHZcRH5Cy5IG3DeOWM+pgjN5p/f
         z2IafweWP6y7xtpgVx2SiHnxTXwhj0iaMVsLrrlzZQq7bRSfRVMuCEUh+tWV8H9DS58u
         aJCKf9032yjRjBGBqlxpBtBCY2F8hxxroPlJdjD0YqGE2FN2hrWt2ISUcwbHesAFs7PU
         FThg==
X-Forwarded-Encrypted: i=1; AL+hErGj1/aDgOHIexAPbxh03BqT3G/R2+vgIaAHpnV6u8ZOfmo+I+p4FrFA259lAeagoafjzFljxQw5DmkkEPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iuXJC3TUVQoasmVmqcDe7Ttay7wFnhURu3rFjqL3F3AY4PMhS
	6fpTm1noFbpW0RhxtlqlnYFkPudSAtmqtWoKLAfwmpuJ2RGb42B7uBE=
X-Gm-Gg: AZFdTZclt8EasrRXF1o/WOmCkwPF7cMUDZLiXYqzwA2kjqBEGEi2gzJceShv5TyLVcT
	nDmclOU++AqAqbPFWY8ZVgEFf0gUkfX79QXaGtDlZ0TDy51r3eX4y3mE6hPVyb4MtZeh2rjsRIK
	fmLnti3lbcdst28mMVcK65wE20/FwAS91e/fcnjmEpUfFp2gyN3vWVCOlA5WK2a4RHfFdac1aHg
	E20Lim1GP5iJ9Fyk+YNgA0sKxFwYeX1JUnVSpkJvpusuBxqpWMy1dBZzGIwSLr4hT7Hgquz7D8C
	3Oi9BAldzp2HYdTJ6mxVqiVx29MjC/PlCSq3MfdwarVDI3Daf5jDrEHPyoy5J46PTKZQbbosaUX
	04XlbW9UfBB8r48NKXx3ZyGU//q+R9bpymsHn9pCWS3vOSc1S3E9gS1cwPO+HPYYJntQVqJ3V4x
	ezn4PSsfLs4OtFJztBUhe56BCfOHDW/NDWVAIlfnmqQMDL6qPfHAhAQcnZEbShUdxmNAf7eLF/x
	MXsPKlj2VpUwfiEwl4RqwndQQV7QMHkrr5Q07zlAMmsMe5QWMAz0IAXUGRUR3DAW2IMTHlQC8Do
	hUNPGJY8qAqIu5/jUCEgRcncn8SeJA6KkJNgSA+3bjOhio022eo=
X-Received: by 2002:a05:6830:4c07:b0:805:9b38:6f7c with SMTP id 46e09a7af769-86315b0b8d8mr23407775a34.29.1795635956067;
        Wed, 25 Nov 2026 11:45:56 -0800 (PST)
Received: from miso ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm13226969a34.23.2026.11.25.11.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:45:55 -0800 (PST)
Date: Wed, 25 Nov 2026 13:45:53 -0600
From: Matthew Laux <matthew.laux@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 12/12] media: add driver for StarTech USB3HDCAP
Message-ID: <awc68fa7jb5n1mRv@miso>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
 <20261121035523.26764-13-matthew.laux@gmail.com>
 <99aad66b-675d-4a2d-8558-167c11ea725a@kernel.org>
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
In-Reply-To: <99aad66b-675d-4a2d-8558-167c11ea725a@kernel.org>

On Wed, Nov 25, 2026 at 02:39:45PM +0100, Hans Verkuil wrote:
> <snip>
> > +	if (vb2_is_streaming(&hdcap->vb2q))
> > +		return -EBUSY;
> 
> Why is this needed? Does querying the timings while streaming actually interfere
> with the streaming?
> 
> This is expected to work, but if it can't be made to work, then it the reason should be
> documented here.

Removed in v8. Tested and it doesn't interfere with streaming, and the
buffer size can't change, so it's safe.

> <snip> 
> > +	case V4L2_CID_DV_RX_POWER_PRESENT:
> > +		ctrl->val = 1;
> 
> Huh? It is a volatile control, but the value is fixed?
> 
> This makes no sense.

Removed in v8, I had this as a stub to stop v4l2-compliance from
warning, but the chip doesn't actually tell us whether RX power is
present, so I just removed it entirely.

> <snip>
> > +	case V4L2_EVENT_SOURCE_CHANGE:
> > +		return v4l2_src_change_event_subscribe(fh, sub);
> 
> The V4L2_EVENT_SOURCE_CHANGE is never raised. It is supposed to be sent
> if a signal goes away or if the format changes, but I see none of that in
> this driver. That can't be right.

Removed in v8, since nothing generates the event yet. This
v4l2-compliance test now fails:

fail: v4l2-test-controls.cpp(1175): doioctl(node, VIDIOC_SUBSCRIBE_EVENT,
    &sub)
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

I do want to support this feature eventually. The Windows driver has a
complicated signal monitoring background thread that I still need to
reverse engineer.

> <snip>
> > +	.vidioc_streamoff = vb2_ioctl_streamoff,
> 
> Add .vidioc_expbuf.

Added in v8

> <snip>
> > +	/* For applications that never call S_INPUT... */
> > +	if (!hdcap->hw_inited && !vb2_is_busy(&hdcap->vb2q))
> > +		usb3hdcap_init_input(hdcap);
> 
> This doesn't look right. I think this is something you want to do only
> on first open, and then you can use v4l2_fh_is_singular().

Agreed and fixed in v8

> <snip>
> > +	hdcap->vb2q.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
> 
> Add VB2_DMABUF. I would suggest dropping VB2_USERPTR: we don't really like
> that streaming mode.

Added DMABUF support and dropped USERPTR in v8.

> <snip>
> > +		hdcap->ctrl_rx_power->flags |= V4L2_CTRL_FLAG_VOLATILE |
> > +						V4L2_CTRL_FLAG_READ_ONLY;
> 
> It makes no sense for this to be a volatile control. I suspect there is some
> confusion about thi.

This control is now gone entirely.

Thanks,

Matthew
