Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351127;
	b=TZ9il6hGtXvrdQ3LfUakpQ6uEWWJ8HvcBtTguED9ai/KU1ekxk1ZtOKiiXaIPP/g8rpj
	 H0styRRM/GDW8hbLcakj5DLLxj0xbL6tlaRBSHJhSSLdmIiNg+eTQ2+rTHMugVr5xS/2B
	 /KtVjIS4tYufo6PLM3WVabWXkYudlJhzWhAKrW/7Nenmsj6mG9SR7dhdK0YzUXPyc73by
	 CQTJySA/jB20ZRstztEfpjxN6DsEj22C1e9QbY7f2JDeQtwLy2+JPQiRb47CwR9zsCWRp
	 rrWjvKJYWQCx2ccwdafmKPIVxCUFTiGT/wU4B431FtjW+8rqw6amXPDFw80aUBUOphQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351127;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zm2Y/kUyJzvrSs3StQSwNPrcA/9WuxmjC72XodycZm0=;
	b=ZOTkBq0G6FSdbl96FQTUpTZboz8Vpbi9Fp15Z4wRHrjloiJvYj5fKxiXa31ZyP5HWv+Z
	 o8h9YzieXnlh1zWhlCIHniFfRRhf69idb/e/CCa8d4T10wVVFgkEMsPVIe9633vD1G8UH
	 l7NCMz8iqH/UHLi+8Mdyia74ZaRdCLDS0XyE5jtM8AFiDMV6DUcm1Gh4c/Ex89Q7d3jAe
	 My8gZWZ0MUMLsxyLezTDUKYyS16btIHc51m29ILGUJfBbeaxk5CJDvd3inj1xpUlf/lKM
	 npoiEJgHzrxC4MJlW48jExJoIfMNOxzfMysugJPyBubIUF3dWmbwTrjIs8tKVuqc2FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="Q856/BXH";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057FD606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Q856/BXH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965B41F000C6;
	Sun, 22 Nov 2026 12:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795351126;
	bh=zm2Y/kUyJzvrSs3StQSwNPrcA/9WuxmjC72XodycZm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q856/BXHKGcPnLn8ig4OsQyUCkUYODPczmrz6kNTOK+q80WlnRWFgSZ+tOx1Z4ES6
	 /1pull5mxof5EAd8cLnturIYMqoLkjkJ+Qw6skOS8PGF5ET1B3sxMVwWzSQinQ7ng+
	 NJs/Ht/axE8UqbxenIzFh2GWRN47EY4SdKp+ZbVY=
Date: Sun, 22 Nov 2026 13:33:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] firmware: stratix10-svc: fix for v7.4
Message-ID: <2026112237-pardon-equivocal-4691@gregkh>
References: <20261116153450.3073467-1-dinguyen@kernel.org>
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
In-Reply-To: <20261116153450.3073467-1-dinguyen@kernel.org>

On Mon, Nov 16, 2026 at 09:34:50AM -0600, Dinh Nguyen wrote:
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/svc_fix_for_v7.4

Pulled and pushed out, thanks.

greg k-h
