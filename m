Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947851;
	b=4O44Qn9tuX928fWMLIH7Pd5fSgN1vRb8AXx7yZOLz3DW4xPv12V+BP9kfG+X6b+p4O7f
	 yWL3xJlBucLnKoFMH/ixOn+HxWLpJIRGjmSr882R8MzWFNmsjXY28W1hugI+cLmnqJRHC
	 8PE1vy8oEBvOATDiB3HP5ZrNbjxzYyvX1pWFiHQyFXjJ5ipjvf8sXU+AmQN0o0uuCxFSy
	 fkCiEbtt4Wt/j8U0d6UhBS8d7+rNzlDOrPAn6Cp1NJt7P6AkIkHQC8DtsBC05aW4Rm5pa
	 vGI9ZuRbzK36fsdGNXaKu+tNeYCU/aRXE59aKrObIcCLrMjZpLSaT3VBeSKEeRfosLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Z6Tpo5ap6GSFoMGBO7jW2q44NoxntZjBeE2WFv53Tfc=;
	b=BLbkmyAEcPekOgRUnVCsKs3iM0ZwtXUWXIgfrAg5Y0dgqanArk8qt3EKiF+iUGovl35I
	 1gcSRthwgTAcCQIzJAOtTjDkye1l4v2aSrxrZmZ7M9YdLSNCGOuiUrexZsb9xQfOYJhuG
	 o5T+j5xU4pN5bc9zrcQyTJ2GW0TbWUzT7xKMYu0aEGLutDpZ0+xfZdH+h9eKO91cDtv1/
	 Q0MXKT9bWRXHe3fQpjE86Toc2Q/bhtk/WbJ5SFcxxxfUdBBqiRgzFkNoMrIkOAlos1ljN
	 fZKs74Wfg5j+fv45DV3UJ1VkAJXDBu4B7lCLrTImY20noVzc2BUZBztsjnhvrZucGTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=hUcgLnaQ;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAC1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CAC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=hUcgLnaQ
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so976396d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794947850; x=1795552650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6Tpo5ap6GSFoMGBO7jW2q44NoxntZjBeE2WFv53Tfc=;
        b=hUcgLnaQ+SQElpouvg4p2BhtZ4Iev0t+HUWmXHy4nOG4uSaSNXppj/XNwBivKpTl/Q
         vksHTCRR1b7dXrGp25zpOF11vyXznTG1fjS+q+ee3iu7WpX5ZUUkVyYdlGVx7sMdHLSq
         jcptiQnGV5i+QqCFqDXZO9ET17+ecycfPG28wxftXf0E8G4gygKBoqshDqUDPqlKIAsl
         pmdu/bHK+iuE4ycri3z55lcemOy3JNHG/quH4E1Uo4wfM/4BweKY4aO5gtNNnws/T7ue
         K9NH1qs/7MhEWmEp6cIqh+RciztjqPv0TpkI884J7vRHrVPgQ9rSNj/NZCuqxCidybaN
         8YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947850; x=1795552650;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6Tpo5ap6GSFoMGBO7jW2q44NoxntZjBeE2WFv53Tfc=;
        b=jESO8bRsJADXiYtSZVEjirzhXB/mCGCskfDyLMgeXDDhBk87HDzwgckgX3lrnoUwM6
         tHvk0HeSGQ3uN4fbkjll8IQvuOYlNSF555iWPDsQ35ocR1VroebHwyU5fNkIxjEXTOwi
         q6cs32RH/v1fASrYkwphzVdF3+fR5704R0csOYwtf6r2BVMeO5Y4O7sGx99cT/dqWD6+
         v7+etXBxETOnlOhLWIcIHY3UisoLoyqNcxgBVzKvOFFuZyVMtjh1KgU4K7AmmryNw6oK
         +rCMIVnQ2EnbymhI82VSHkrJJ/uP0ht+LVqBpBRPbK5vKBu7Juo531ZjN2PjlC35y6a0
         AzPA==
X-Forwarded-Encrypted: i=1; AL+hErHu0UEMtbAnIGw3+Qi6Xz2X4Qc+lmL2p6+ULHEiGf9NP1NbDfps/rKuyL6SxRHrQzIZhS/nCN9rHwjNdmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A9B2So/Sho2qDo2Brxnh9kD5BQf+VInQ2W/f0DEeTpFmccuOf
	YZ5hOual+yy9boJbboLCGjT0gdTyzTeYDzqhn+GV3zTI9G76ZNgqt/lMg1TdQXZZmQ==
X-Gm-Gg: AZFdTZe6BO9JSE1l+GjS4L9DhSgYxgAw4wNo//WMTLsGVnLxpJlSdYR/xptspA/HeQQ
	ujNiALlSm8AfKaGRM5aVL+s6zPT4STwOA1hHfm48WDxuJf4tITsUc0hL2imMZWitpQIcsaLMNrE
	iuYxgpwLfFja39aeS6YRqU13mNzqBdxiKAVX6SkKFTg7ysayOnW1y4xPt+0LK7jHUgLz8TBTFyL
	2GSXb9hiiVZy0JlxupMnvRnSNoLXin06Tf60N4r59CohsLUlJzZeScJpRau55phmJhj1RB2EXGM
	jjF7h2VcdlezLiFO48THdQKiD2ibcWxMvRdUahiSm2JqBUUfScJdjWc3Y5C2boEq/1E0rkZa2Z6
	STR2EkS35ImFjukq324du7b0fPR84yC0A7Arm+xBjRVwnhWyXBOjHJHkW4Iker+22upTuTmLsN5
	DEO/3i6RQQHoXV8ryQzF2FzxNwMTlwyUg7vVkO8i4AbxA1x09WrPXIuoT7FZnSbzSwMADVSwUUd
	ohVFw/ZW7JmdcXulq3oaUNeOrHt6o4r39yMyIc8YHGU8TS0yeoNBpJzXXAfnIyw1KCd3D3LSj82
	Z76qX1nOuptzTmirEubfPChejT8nVw==
X-Received: by 2002:a05:6214:4521:b0:91c:52f2:b469 with SMTP id 6a1803df08f44-92114f422aemr4503286d6.15.1794947850014;
        Tue, 17 Nov 2026 12:37:30 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f894csm3423466d6.4.2026.11.17.12.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:37:29 -0800 (PST)
Date: Tue, 17 Nov 2026 15:37:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: usbfs: reject SETINTERFACE while suspend is
 allowed
Message-ID: <44d9ed8f-c2c5-414e-a5cf-9dea30866574@rowland.harvard.edu>
References: <20261115163709.226641-1-teel4res@gmail.com>
 <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
 <20261116060549.370140-1-teel4res@gmail.com>
 <a7e6b6f9-9926-404a-b185-c9fcab5c9d10@rowland.harvard.edu>
 <20261117023858.467683-1-teel4res@gmail.com>
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
In-Reply-To: <20261117023858.467683-1-teel4res@gmail.com>

On Mon, Nov 16, 2026 at 06:38:58PM -0800, Cheng Yongkang wrote:
> After USBDEVFS_ALLOW_SUSPEND, a usbfs file no longer holds a runtime PM
> reference and the device can be runtime suspended. When it is resumed
> through reset-resume, finish_port_resume() sets USB_STATE_CONFIGURED
> before usb_reset_and_verify_device() restores the altsettings. The
> restore loop also runs when a driver bound to another interface calls
> usb_reset_device() from its resume handler. The resume path does not
> take the device lock, so a SETINTERFACE issued in that window passes
> checkintf() and its usb_set_interface() runs concurrently with the
> usb_set_interface() calls of the restore loop.
> 
> Fail SETINTERFACE with -EHOSTUNREACH while suspend is allowed. A
> program has to call USBDEVFS_FORBID_SUSPEND or USBDEVFS_WAIT_FOR_RESUME
> first, which resumes the device and keeps it from suspending until the
> file allows suspend again.
> 
> Fixes: 7794f486ed0b ("usbfs: Add ioctls for runtime power management")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> Changes in v2:
> - Move the check before copy_from_user() and add a comment (Alan).
> 
> v1: https://lore.kernel.org/linux-usb/20261116060549.370140-1-teel4res@gmail.com/
> 
>  drivers/usb/core/devio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb9425480..8a032f4b547b 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1531,6 +1531,13 @@ static int proc_setintf(struct usb_dev_state *ps, void __user *arg)
>  	struct usbdevfs_setinterface setintf;
>  	int ret;
>  
> +	/*
> +	 * Avoid racing with a reset during device resume, which restores
> +	 * the altsettings without holding the device lock. The device can
> +	 * only be suspended while suspend is allowed.
> +	 */
> +	if (ps->suspend_allowed)
> +		return -EHOSTUNREACH;
>  	if (copy_from_user(&setintf, arg, sizeof(setintf)))
>  		return -EFAULT;
>  	ret = checkintf(ps, setintf.interface);
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.34.1
