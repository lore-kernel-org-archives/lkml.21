Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126142;
	b=nz9g17SR+uPGm/kS3IiNSBUdSh2uvvb/fYHoZwdD2HYBxZzCjV2VOC+rCwFfOGxJ3PGu
	 jHX9Gts60TVGJB2ow3UNzlERsd5wNUYAUSYqBAK23L1Fkc+LxETfO2FVSb8plvUDUDriX
	 RkhvSTiu30/zA7yPKgOblPSPzj7kiTjdnuSPR4SBBAcTtr7Tu7dk0tYyawnijJTTnt5NV
	 OAGSmqh/Bt+anv7w5wzGUQnGZCWcJKQDoaKpHKFiLFY0HtjrWf53P8LpAlf8Z/5rY6hNp
	 YQqQZasMwZgOVAGVE+7ylfVI/BgrM/bzybzkTHyOIyhk/i0euUwu6I/BYz80mcY0F9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126142;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YpoAHjU6moP8icUI83qqCJrJjrDSorwcFrdvb3bizYs=;
	b=XXve8Vs/se0Z5LcsqvH+1vBuXSB2HfnJorNPiY8PsYbch52XsAwp8afN/NvRR0V5dG+w
	 exWqxI0ax8l6XLjWq0W8GRWYIgQfzl6G3N9R9O7WUvTb+Tlk2gbPqieXRyWUJ6xunrPWP
	 p8HXh7IJmghLJ9GrW5UTGHpGUHfVqlWcq195UAAmKZ/6Cvp89JMoKF2eYHehVFA0+O2M6
	 HBYPBqNqcs4OP9kmP4GafeNqjMTNgemuVkgQsM79Vmai9wQZxCZAmuM74xtowu0k/k9U3
	 hzaYu88fmPkqLT7xJox7IjYLu6dVvLzbl0gcRD34cMynMm5VNhFGJ4dTOrjfYXQ4ufg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e83NMGyO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9723F606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e83NMGyO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8441F000C0;
	Thu, 19 Nov 2026 22:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126142;
	bh=YpoAHjU6moP8icUI83qqCJrJjrDSorwcFrdvb3bizYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e83NMGyO48+gsumhHlshjvcLQj9NOG9c0apfD6S0AHSr9INyBijvVdS/3layX9/7S
	 /GDDC6z41BIxo2dts7bl88bVrvmZ/A2FZPS/0WpY1jtYITVff2rVR6fspvIrJFhKex
	 AA0o/yH3r1FIa/TFRzZwVxH0oJjrqFJU5jLD+pauU6MjOylHv46tbAwGGM7/sxoI+a
	 aS9uGEijZ7466Oypm+EGpoBRX6l8nozwH3diNAwISqy35kv6qrDDslZUj2vzI6uPQP
	 L4bFfWp84XGPJPotJovvGBwOefzBCsbkvcKG7B58keaT9KbfM3O7wdRrO9QpHXeMGC
	 JgJD6xTOpEmPw==
Date: Thu, 19 Nov 2026 23:08:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
	rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/vma: Fix a memory leak in i915_vma_pin_ww()
Message-ID: <av9yfXc2CE7ZoWp-@zenone.zhora.eu>
References: <20261118153205.2432736-1-haoxiang_li2024@163.com>
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
In-Reply-To: <20261118153205.2432736-1-haoxiang_li2024@163.com>

Hi Haoxiang,

On Wed, Nov 18, 2026 at 11:32:05PM +0800, Haoxiang Li wrote:
> i915_vma_pin_ww() allocates bind work before retrieving the object's
> moving fence. If the lookup fails, it jumps to err_rpm, bypassing the
> fence commit at err_fence and leaking the work allocation.
> 
> Jump to err_fence instead so the fence callbacks can release the work.
> 
> Fixes: 8ec5c0006c50 ("Merge tag 'drm-intel-next-2022-05-20' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-gt-next")

that's weird to use the a merge commit as fixes, but that's what
it is.

> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
