Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086630;
	b=BXhxUIIRSQ9/MedYwEJiOjIMGYd+Ov2aGftfo3sTPt5D7z5gaWriJ6WBHavTKRqSAHPU
	 Xn8OpqUyXF/DgcTHzmUEAgSubGAn221f4e6r+WS06UDH7gYPe0V2Bhs8tJlGLFgdyzLoi
	 8ag/yiiTD8CmBvps/pFYlFrxaeKI4PPLLRf4zbUznSSGjvniJECAr5mKenYrF3DgHLjRT
	 3o8r4LLKctqFrRNKiKdcwJRpkuNB1b9rWvJz81ZTBSmHy0tP+X6dzT2V3huJoKhzSqGZl
	 0raXiSeQyCGxuZUMpk3nXrEmBLQ6bcp+yR1hI4OYLEVoNc9y/pzRuwBKIb06tF0uFWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086630;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=5ytGgE5GZUr/psUPZbg0FpgA9hVlt3IvYR3bQr99uXI=;
	b=KdXvI2Kxz//uTzyqPwbWlvraIqxAy2aSjgGJhJhWRqXPpISMa126ExU+R8TeVu01JVEQ
	 iKFChM9LHe5FdGGnfuc4VXk/qGhNDpUTeFbs73pOmop60xVtMiN3aOnLYz8P1h/+uSYiE
	 3ju4JqcDCKPGhC+yrtEwTaVI3E2gmvt4Tw8T4S088Sv0p4xyX0qV2laEmYmNZcWxc1HgL
	 xPaZu4OscG3WVth7vyEz7LaNNum1WsNN2z18apry7OOjBWxEw5sbACchwkvr1QzWaLzfW
	 UQn+IzA0sns3bfVeJu7ioDBAt3HJ7yQMlQeWyK9iUoSFcsTeexCGkd8Q1UraLG2R/Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CAlucz9j;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4959606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4959606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CAlucz9j
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03B0219F0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:10:26 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B97943F882
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795086628; bh=0vFrVGLPoOZ2lULqO3Q0WBMmFaK4e3iZvfwtZtTXdoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAlucz9j0m/OInFTovu+9VnB+OVVUJcfHEvJ66GRN4YAWim4bz0YKqWdfK4r+f960
	 3vz1pa3GXPfusPT/7p/244CyUZ1h54jvALgp1D/11bQeiQXi1zv97smSqdxbz39LDi
	 YRRfQblH1JG2xe67TrtG2jnUTDFeOGkAv5tZzsKI=
Date: Thu, 19 Nov 2026 11:10:15 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Paul Toadere <paul.toadere@arm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Christian Gmeiner <cgmeiner@igalia.com>
Subject: Re: [PATCH v2 0/3] drm/panthor: Report fault information to userspace
Message-ID: <av7ZFwXVChENRVcd@e142607>
References: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>

On Wed, Nov 04, 2026 at 08:52:38AM +0100, Christian Gmeiner wrote:
> The Panthor CSF firmware and hardware report extra information when a
> fault happens. Two kinds of faults matter here:
> * faults raised at the address space level. These are fatal for every
>   group bound to that VM.
> * fatal faults raised on one of the queues of a group. They stop
>   further submissions on that group.
> 
> This series exposes that information to userspace, so the
> VK_KHR_device_fault extension can be implemented on top of it.
> 
> VM faults are reported through VM_GET_STATE. The VM keeps the raw
> AS_FAULTSTATUS and AS_FAULTADDRESS of its last fault. Queue fatal
> errors are reported through GROUP_GET_STATE. Each queue keeps its raw
> CS_FATAL and CS_FATAL_INFO, and the ioctl returns them in an array
> indexed by queue. The kernel does not decode the values, userspace
> does. Nothing is allocated in the fault paths.
> 
> Changes in v2:
> - Report VM faults through VM_GET_STATE instead of copying them into
>   every group bound to the VM.
> - Pass the raw register values to userspace instead of decoded fields.
> - Keep one fatal slot per queue. A queue stops at its first fatal
>   error, so no allocation is needed.
> - Store the uAPI structs directly in the kernel objects.
> - Dropped the recoverable CS_FAULT reporting for now.
> - Bump the driver version to 1.10 in a separate patch.
> - Rebased on drm-misc-next. The queue fatal info is protected by
>   events_lock now that fatal events are processed under it.
> 
> Link to v1: https://lore.kernel.org/r/20251215115457.2137485-1-lukas.zapolskas@arm.com
> 
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
> Christian Gmeiner (3):
>       drm/panthor: Report the last VM fault through VM_GET_STATE
>       drm/panthor: Report the CS fatal errors through GROUP_GET_STATE
>       drm/panthor: Bump the driver version to 1.10
> 
>  drivers/gpu/drm/panthor/panthor_drv.c   | 26 +++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 33 +++++++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_mmu.h   |  2 ++
>  drivers/gpu/drm/panthor/panthor_sched.c | 32 +++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_sched.h |  5 +++-
>  include/uapi/drm/panthor_drm.h          | 52 +++++++++++++++++++++++++++++++++
>  6 files changed, 143 insertions(+), 7 deletions(-)
> ---
> base-commit: 6f7098738fff3ec7393f924343188cb8e6ebc5d2
> change-id: 20261014-panthor-fault-info-v2-330a9f771fd3
> 
> Best regards,
> -- 
> Christian Gmeiner <cgmeiner@igalia.com>
> 

Sorry for the delay!

For the whole series:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
