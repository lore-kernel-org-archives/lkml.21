Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777673;
	b=HpY8qjQUk/CYVfpmxz0W9PgoNb8qGSsEWEu748HfkmmiL+d8oVIGLW6BU4rJA6y/3uvO
	 CPdeaGX2i46cOmCv5UDVnAZeqRHZQoPjxtgNJ/WPFjJibcuZshvM2dJblMXD4xaBuz1Ik
	 CCjWCPLaHCKiasl1TMKfGgsvtkqjm2ZEex+yADH7Ej/TvT7vI2yKvoUodz8zsWIW2bLY9
	 sjUQZEhxYxEIGsWYd8FURGeUAiV163kGuci2udXF8q+a+zntPcFp5WkoujX6CJz6sh65s
	 o+tkGo3QeQUuPkSEug3qB6R8i18UfBixZVbRig08T6rDM6J0bwRZabOizOcFTMlYHbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777673;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=98ZWMxWS2IYaDQVqODqy+6yPtaDVuA2mzKuGshk4XUU=;
	b=CaIzUXs7pnZLbEMBuAs+hmtAaiMLaeLmsyEEZdoAXSZB3l83OiNa1TlgyyeRF989dfEr
	 5AjUZlIehZX2887yvMSVN/pG4UmrQ2uDAQN/C+5lRNCIGQoNxHd+ueXtLdjPN32OMBLdA
	 q8eMrDTtXv0xWlsJKx32CV3qRL/SvTJXwuAloEM4RJ2MKrGHXCXfqIavbDEkqaVSLeqKB
	 s3Wkot6whifxNS6nli7e3/8JEEHWHh/8EYVebm5/b9cr/gid9kSp7d3xUDgnSL7PioL6L
	 QDGYrfpZXk6Xl1EXfdHeAf6QFuCke8qSoZIcKUO4+9DA1zBn2jwwW4YW+8tRV0tIcOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=guq3A8ut;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D6A606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=guq3A8ut
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35441F0089F;
	Fri, 27 Nov 2026 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795777672;
	bh=98ZWMxWS2IYaDQVqODqy+6yPtaDVuA2mzKuGshk4XUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=guq3A8utFAXnWcLrZltY9uPz7PlKhLTa3atylYjDhZ1uO+p+gngVXHplVjzHPaOR8
	 G8/bjwo7Be4DZ6XdlAwKpcGkBTq9Z0xd8S2AN9Oj2sIoOOjxS7v11ANSsie1DNixKh
	 psYHntr+diCa2QZHehiMX4yzurFE7FLhdq0UMOm4=
Date: Fri, 27 Nov 2026 12:08:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: Re: extcon still alive? [Was: Re: [PATCH v1 0/2] extcon: Rework
 initialization of i2c_device_id]
Message-ID: <2026112748-panoramic-splendid-4822@gregkh>
References: <cover.1779100597.git.u.kleine-koenig@baylibre.com>
 <aimaTrJvXFjbDDTB@monoceros>
 <aloDsjYyv3gCsx39@monoceros>
 <avxptCL2mq7Z3vPi@monoceros>
 <awlOvzxRjyQo6fOI@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awlOvzxRjyQo6fOI@monoceros>

On Fri, Nov 27, 2026 at 10:50:11AM +0100, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> On Tue, Nov 17, 2026 at 03:53:17PM +0100, Uwe Kleine-König (The Capable Hub) wrote:
> > On Fri, Jul 17, 2026 at 12:31:20PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > On Wed, Jun 10, 2026 at 07:10:51PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > > On Mon, May 18, 2026 at 12:41:43PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > > > Hello,
> > > > > 
> > > > > I plan to do the following to the definition of i2c_device_id:
> > > > > 
> > > > > 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> > > > > 	index 23ff24080dfd..aebd3a5e90af 100644
> > > > > 	--- a/include/linux/mod_devicetable.h
> > > > > 	+++ b/include/linux/mod_devicetable.h
> > > > > 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> > > > > 
> > > > > 	 struct i2c_device_id {
> > > > > 		char name[I2C_NAME_SIZE];
> > > > > 	-	kernel_ulong_t driver_data;	/* Data private to the driver */
> > > > > 	+	union {
> > > > > 	+		/* Data private to the driver */
> > > > > 	+		kernel_ulong_t driver_data;
> > > > > 	+		const void *driver_data_ptr;
> > > > > 	+	};
> > > > > 	 };
> > > > > 
> > > > > 	 /* pci_epf */
> > > > 
> > > > I want to work on that, but I'd need this patch series to be in for it.
> > > > Do you still have this patch on your radar?
> > > 
> > > While I still have to make several patches land before I can modify
> > > struct i2c_device_id, getting the patches from this thread in would at
> > > least make my queue smaller.
> > > 
> > > FTR: The series still applies fine to next-20260716.
> > 
> > It's November and the series still applies to next-20261116. Does
> > someone still have this patch set on their radar?
> 
> This patch blocks going on with the above mentioned quest. The patch
> we're discussing here (well actually that *I*'m discussing only) is
> IMHO trivial. The last patch applied to drivers/extcon that went through
> the hands of the registered maintainers was commit 1bf0ba46d9d2
> ("extcon: usbc-tusb320: Make typec-power-opmode optional") from October
> 2025 (picked up in March 2026).
> 
> Greg's char-misc seems to be extcon's upstream, so I wonder if Greg
> knows something about the state of extcon? Greg, would you merge my
> patch without maintainer feedback? If yes I guess I should resend? If
> yes, I'd expand the patch to a series adressing all the needs for my
> quest also for other *_device_id structs.

I know nothing, and I'll be glad to take your patch, is it from this
thread?  If not, just resend it please.

thanks,

greg k-h
