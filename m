Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200859;
	b=DZNT++j4HMgPh7E8Klw+Z4W82hJm2VFtawYrb9gV9+tAvabVXeruOsEYd/WaKzVHj5M5
	 EJQ3IeMaRsnlc7m8ar/aJ2sOZyo9oW8FCWfrKGXO8+ysdvI9JAbgBQg8ZT9DC+0A7wgn8
	 UbvZtUcvlkGSouD6gk5wtQ95zMfMdJtmsXUfyuXVtztF9yueswcRlx3VvGtPwE4s6jLnW
	 4/pW4hgNp2WMNk55k+/AocIRUX/UtOBuukhjlrNngGOz4TXXX3cGZat2Q5K3mnK4LmZ9e
	 r/BjIJPeM5etCuOaA/iwEZzlipv6Y2piTLIHQ85sCdg/KhorL6wfgePxF7NuQodcVeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2cDvgzaEPEJPCI6Ok0IK34cIag8JscyuYpBaCTCvSvo=;
	b=wcAIttHRbqdr/gcSy2dbvrCnSmYHWZYBESDn7tQ++KydFQedCL7eE7PDKSFgvCgGH2Ng
	 mQdpa3o1Wb1x7J2Tt64820qdRhOyy2MMiE1L0v+p12GJBzsTH742Wcna+xbx39yLIrYYv
	 ZsPTRgEYcHzs2NA9NU289IFBBLb1Twu8MsIwNRoVBSKRF4QieFWZh71hF9qs6RJtD9I2o
	 bXQ+OblTZS49DNglQkyNh0XEMaQR0zVfbN8XrEAp4g9zA5yUpurrBDil4uUFM4JONUtzn
	 RMEzmbmb/u0jzePQ+yop5lc8qQFeVhnfgWnvMvVb3r4bEyMstjsfTC5zFPFGpHhE+Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PxUyExOQ;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A41F60A2621
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A41F60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PxUyExOQ
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-94960131b30so133472985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795200857; x=1795805657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2cDvgzaEPEJPCI6Ok0IK34cIag8JscyuYpBaCTCvSvo=;
        b=PxUyExOQamKrAoNEpUWtU2MH9fyiBoDE+oyzzWlBCvln/cdtZhzS8I5kFGTGU8UK4s
         VqHhE4Vt2QC0JD6xKAIKBwlckOueByn4Mi0ughCh4Nrr229Xl1hXBMSAbxW+HnaEcLpD
         grrx6A8C/3YbVNUlOircjbOUQgbWr/s5ei3yo9JC4HsqqHqSe3sommFF/pddgnoIDw5G
         krk8Ra0WyE6At2RXi2ZH5L+qfuBkTL1hQltq2S+R6I/WEuaVAF46YIMp0l1MdHmRy965
         7QtohddcDJfzDDOAFJQqDK3KgIG6fgcaNRwuZ4TkNb84VQdsz9mOMj6HyiNGOGMNenPq
         r5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200857; x=1795805657;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cDvgzaEPEJPCI6Ok0IK34cIag8JscyuYpBaCTCvSvo=;
        b=wK4/9ulYTAOpCcNe4uCtP9cVi5RSNbns4MeLQRY16KqXEcCGIhc+XFtfJDBF0VsqEx
         abTIAp0QRx4RLx6qkb/Frk6BB4Z23IE8Zb3zDEDy9jlLBYQaQ09pZwG3T8Uofx5s7z7n
         54E5ZEge5ruxMkU7e8NNGQARMwREGZcfDEXXMZtOYuRbvZLls3UpxBeTJi1zpuVRKP1+
         osQ/N1onvH6CuBYIlrhoRV8HBJTZojJpMI107szIE2INCvdpB/tWm464N2PpPG5eIghI
         5KjNjvr1yL/Z7eyN4MyrIP6hcmzSVmAcTetA7v3SnZOC97aG0ul4pG0w46zhwuIujhML
         tHag==
X-Forwarded-Encrypted: i=1; AL+hErFGqUD8GfkaZbI3gYho9QOWwdCzgSEpmvndMXZAo3Y0tHML2tjMUyoYaWKS4lHRuRZA4TTctL7atHe9vV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hGiBMJaRp0AMxjWQGC3u9h3hfaupysO76k8cpZb4z6ff/1vwn
	ZRDbld98lh0QHTlY4rVRtqRVsZgg3BaiZVAdpApa1bsaR+/iDiCqmtwrU8HpHFnIHzk=
X-Gm-Gg: AYBFou3qQzHyL2/qnr9HXgak/Gle6/Hp2Rg26k9HJkSnh96yADio1oOJeyXx/rCug/G
	a1+GTMtr+EF2nNE1utxjhgZTJMVtHiawjJGqEKAcBvOLk9hbNDoYsuqSIt+42d1ogGf6TtzzO9Q
	ZwwTGf8ja3PfMiWQoumz9u+ZiWZrOu54feqjWi+4RmwB6j01PKIbPwYDYwzfybY77LZyTAf4b+M
	MAPN66D3kIjqbuac/jy+6muFiMpQvOgnhQW2VqR+gGVwmILYQA3VUkhIdrlXW/48XDpxDuBU7Ll
	8HARgb2tmLBoP74h91X2MJX/LbIu6xULaOjR9ZbHDdq/xR+xCia0gXoRkRx2JD28SuHvHswXsjq
	Tah6C2+EliOQp+XSY4SaTC35c1hxoJJVhqofoyERUEEAxILpYcCGuRbscE4tbAtP3Rny+bgK913
	zZxfSWHCdRq0Q+DfsnqTe3BtK+vGxQXJPoJrx/JdSOQKLhCzONmI/g8ioIYakPhZHGgW7CYfgAA
	blXzDnvmcJdLttPL3pH9eImusR2zoNgj7g67E7sijw6Ih2Q2+RWVcdOcSsXYrxfrrv/3RypoS7m
	CBagTA==
X-Received: by 2002:a05:620a:7008:b0:949:5fee:afc6 with SMTP id af79cd13be357-949baa07369mr665380885a.63.1795200857416;
        Fri, 20 Nov 2026 10:54:17 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm256798785a.17.2026.11.20.10.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:54:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUTkV-00000004ls7-3duu;
	Fri, 20 Nov 2026 14:54:15 -0400
Date: Fri, 20 Nov 2026 14:54:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, alex@shazbot.org, den@openvz.org,
	khorenko@virtuozzo.com
Subject: Re: [PATCH 0/1] vfio: fix KVM reference leak on QEMU CPR
Message-ID: <20261120185415.GA1133597@ziepe.ca>
References: <20261120154730.882393-1-andrey.drobyshev@virtuozzo.com>
 <1075a283-b745-418b-b49a-2dfd41faba3b@redhat.com>
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
In-Reply-To: <1075a283-b745-418b-b49a-2dfd41faba3b@redhat.com>

On Fri, Nov 20, 2026 at 05:52:09PM +0100, Paolo Bonzini wrote:
> On 11/20/26 16:47, Andrey Drobyshev wrote:
> > When a VM has a VFIO device and QEMU does a CPR (CheckPoint and Restart)
> > live update, QEMU creates a new VM and keeps the device open.  The
> > device holds a reference to the VM it was opened with, so the old VM is
> > not destroyed.  It stays until the device is closed, which usually means
> > for as long as the guest runs.
> > 
> > It is one stale VM, not one per update.  It is also visible: after
> > cpr-exec the kernel logs "kvm: debugfs: duplicate directory <pid>-<fd>",
> > and the new VM gets no debugfs directory.
> > 
> > This patch makes the device take that reference only if its driver uses
> > it.
> 
> There are two problems with this patch:
> 
> 1) It sweeps the bug under the carpet and only solves the case that *you*
> care about.  If the device keeps a reference to the VM it was first bound
> to, the problem is that there's no handoff from the old file descriptor to
> the new one.

Yeah, reflowing the kvm fd is not something vfio broadly supports at
all, there a several issues with even trying to do this this I think.

If qemu is doing a live update it probably has to keep the kvm fd
alive across the update too..

Ie when we get to things like confidential VMs there is state inside
that the kvm FD that cannot be checkpointed.

Jason
