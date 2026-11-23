Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394637;
	b=BkRO9zjW7f4hDHgwE7DaO9HZb+zPX8Agp4hxhzAupB6Kv6I1ngL83zbbVZL4efnndHti
	 zu5b5o5CWo5TlBrNtSfzAOvtLeU85+KfCvwLdNrQfkvCM68iIjBPGNdwUoxURhyV3MJTq
	 XgediWOuBd3pATa6oSK0wtmsNeFP6buzLbmxJXB0fsvrhjC9rVtOwAvCMON6MOkGGeU0e
	 G75bhLlUAMiMzgZYcJz0jzNxsUNytcywCHNLDeHleGg/hat1NmiYvvv/Ide957FBlfzkD
	 7PuSMwLQKX2oLb4dpWjSBxeU6dznvgDCsDckqjOSgPgjVJF1RcB0DBz2FbJbHAc4JxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=hERkEl359vLOsdajk6MWJ+B5BvnrFdUZj62Ly/eBB5w=;
	b=5PNWm9Hknch0iHLQu/tDbo0x8qTS+nh4e1sCm28iEGqM15DYbh4pAp7Uv59XwBiL+T2B
	 4yAdWjHkvtRrfIJ7zP/EWsOHWV1am1WtYoooCUImW3dJExfXbE8OMLj6ZWJ0ehkLLT+V3
	 jVcd0aFTJJUllQIxrWl1Ms0iT6AX9GpUR03wPodoVA5MGnVz1DoR2NfoLBHa7aY2xb0wk
	 vR73NA2Bady4qPGmM6+8T/tp4wC599GlnZJE5eJusOTmSXcK1LE1vYJO/NDM+fk/4el60
	 yXa3dinrKd86ITM3OjeCdYux9OfsI/45oB1gR7ZKlynsB8OXDtUSfe+0ovbjGaXdQnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yDiEPN1p;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F92606A33C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F92606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yDiEPN1p
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38644aedba1so3885034eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795394636; x=1795999436; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hERkEl359vLOsdajk6MWJ+B5BvnrFdUZj62Ly/eBB5w=;
        b=yDiEPN1pQUlhdE37Y1+BFEbw855fPdSHoC9n6iTwjrU2bsGXPgBB63jpe912HqB7bL
         +xy3zT0hS+uPXs5AvWwlmjQ8qPDHqlrvb/yOJnsfpCvXGuDb/gdvRhJjJqpTAY+Eepd3
         L9Bx7s0RkOgxLRCSXzDaU27qLlWTxK14pNszTBa0NkqbAV+uPEQh3SwBJdouGXUCQsGW
         RaOnQC8o+MndCNyuimFkryhjMrN1vZhUL1Bnb0qO8uDPYRBn/Ua1aoDZCFJiuH5zlCSl
         NhiH5JsdiR4RSjrouMFTZU9gfgnC8IikwTe/lJi79DU3O0/R1SfFAiz4o3HYd1GKSBmO
         TXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795394636; x=1795999436;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hERkEl359vLOsdajk6MWJ+B5BvnrFdUZj62Ly/eBB5w=;
        b=Sh+6ptjLCo0bpY+WLEhW5A307ddNiMg2tF25m6gpcmhC6IDJpzHpF/4fznNIUaQovI
         pGJmdB7uY6ldkpPOZNeJHjRl4d94CdGC8S4z7s6Uf+z4judeQBv5Y7lu4dHyf4rr8DMh
         wF2Z0HfwOBUcI72IS+XEMAkxagQg8lrIIp6qMpqZAnEZh7dXbtT5/83299IAHUegsqqo
         1aSCWyZcDx8lIvAiyT4cR7sNBw9EBG807RPfASI/j4oS98mTGRsUD4KkZUHbcT7q+gTr
         2mB0u/jNFRFkM8ztUHTE4/BiK6ariuP2sNFznbU6TSzCDW6i/kS0jvMbAW1KuUiNfnZ9
         vhVQ==
X-Forwarded-Encrypted: i=1; AL+hErF/s44aY/Qv0u4VInOdHQb4tKSQ6EODcsz770rU2Vr17iuL3LYGp6Ar5IOEZMLInLLG7O/bnVcQxhOLK7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9yXRcVY9/f6pLmgTfCAgvqTyA7RffvsrtTrNxsYPuVNCa2BrD
	R7O1dMreMATAHzun/UUAkpm44hWmZtgSlwodfEqZQky0e6KUWHYRtRez1n5Bdw==
X-Gm-Gg: AZFdTZcFCMPqF/Qyq7kD0zqsMWljUsQJCtROKtTXvrQDiGs7Qb1GHjDi/zmAQFCj+gW
	h806fGkm2Mj+xTOhaTwGyH+9HAbVnSftUSYtOubqog1dbFlPyzGPFEr8PHNmoLm28fpOFrjhAQ9
	vfezWtFceAylXmfmHrnIoBJlJvg6DkGXLodHzlViT8dHiWqen1CbvLZ6U/w2snfyCRQTAELJocT
	tCVbRqRQqB6rIVPopaaZc+XSCamahRZ/j/zVE33UaWZrfxj1XGgnArENidzFDLd5o8GeFbylCcQ
	7e0q6V9hbnnnR9ivzoSZDbqSZIL93Kw75BZvPbZL6eW591Vmdzo3tjZ8olFMHAGfQVXhO+C1k/Y
	/6774QdGj+6N8CEZI8HMvVyFkorwBGKGHs8nHYjficGLdk0rvDQ3Bk+Bi12pebNFgbZslyeFqdM
	zrzGK8g3LgxIt9zgjtDU9Py+Ld7ppIrLs0dNyS6zuGCDsgvmJByqsx24+pLc4J5e42mwjdpJxpM
	V0q3nB5SDyEBNeSbZfNdeQ5qX3+xMdOzuIig/es9YkPne36bl3bVaR3CyLO021CbnlKyrFCftNW
	08Nm0NWuW+8NifraGlfyJkV8Zkp6Y/Kd1o7ZwSfOurTlAgVGzIJwfzm5qS29NVuMUF1Apg==
X-Received: by 2002:a05:7301:6482:b0:386:ab5a:d3d6 with SMTP id 5a478bee46e88-386ab5ad5d7mr2908764eec.12.1795394636119;
        Sun, 22 Nov 2026 16:43:56 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b4db79a5sm1141355eec.9.2026.11.22.16.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 16:43:55 -0800 (PST)
Date: Sun, 22 Nov 2026 16:43:54 -0800
Message-ID: <38aa3aea5c8c2607f40938b9968baf32@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Andrew Duggan <aduggan@synaptics.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] HID: rmi: Fix report handling, device lifecycle, and clean up code
In-Reply-To: <s9prps69-s294-r1q1-319o-1orrpnr9r9p2@xreary.bet>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com> <s9prps69-s294-r1q1-319o-1orrpnr9r9p2@xreary.bet>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Jiri,

On Thu, Nov 19, 2026 at 09:57:17PM +0100, Jiri Kosina wrote:
> On Fri, 13 Nov 2026, Dmitry Torokhov wrote:
>
> > Jiri, Benjamin, could this series go through the input tree once
> > reviewed, as I have follow-up RMI4 core changes that depend on it? Also,
> > would it make sense to move hid-rmi to drivers/input/rmi4/ alongside the
> > rest of the RMI4 transport drivers?
>
> Please, take it. The HID queue is currently so tremendously huge, that 
> anything that you remove from it would be greatly appreciated :)
>
> 	Acked-by: Jiri Kosina <jkosina@suse.com>

Thank you! I have queued the series for 7.5 with a small tweak to patch
4/12 to use disable_work_sync() and enable_work() in rmi_suspend() and
rmi_post_resume() instead of a separate RMI_SUSPENDED flag, avoiding a
race with rmi_event() re-queuing reset_work during suspend.

Thanks.

-- 
Dmitry
