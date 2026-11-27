Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785903;
	b=kPU09M1lDeqMswareYA3uQYMZP2baCZrOCaeqdXmWjuP2HS9qgLNIf1QnHzNd2yHAs7J
	 OLhwagavPDkqt/SoiOEwqC1DTtOyikDhf2mqfcbYQjXZSpduuAlknV3bfHHNY9y5VNDdq
	 WPfmQeskdYpEnjQ2s/zCsYvhHOsAUsyXS0a92Ezc8wluan8AzJezCJQT460RzgOKt/+/1
	 cya7Oiy/hm4LCdwI19vJY4ItWwgwL7NBr39EFqAxXGqSl7ZWC7bzTzXYMlkSWN9B+FInG
	 w9+tr3dWQ6eRAzMmO2xF644JXuoU9PQCdWFw63veifKwzoZCqO90NV75rNFXkJ4UL5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785903;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=szfGN/dgC/JLyBFU1VQYVkraiko0/qhujWRZpDszyZE=;
	b=3Mwj2UWI8Sf542igq9jVUSBYkmmShgJ7gLltNds8jcB7VgaU9uAI/DdOgTmk2b6dw2AF
	 +aEe26J/1BzO+REMfo6DbG5Eez0MxlSthFqk5R0WePpCib4LYIlksoqNx+Eb3pwvHDsqn
	 RVBUs9c8x22Qj9OXIqVAGU2oqye4SACJKfW3lLOhbHKnFQcm0sHtsyggdINUvpiKaptpx
	 yanKqKCdX8YOBCmdXpcJWbUpR7wcnSRIYV6fW1RkWT9/svk2UlnydS+j97EA+En0OdAcY
	 zdocsVU7Y7+k9Ui6DYZkGGDJ9Qe62dfdzscZerr50cIN/i9nPPGd3Q+UFQeCL54hd/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=K+d8pQWv;
	arc=none smtp.remote-ip=95.215.58.9
Received: from mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6636606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6636606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=K+d8pQWv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jUWIbjRKrhloOv0XHKi9nPNyc6F8oiWX7SWfLE34nxE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795785900; v=1; x=1796390700;
 b=K+d8pQWvVXZhZVPjVcAJZl3dN/Pa+jtxcXkLz7fGXUcPf5SXzGuGlIxKbEZx666YSe9EKmcJ
 qT2oAni9LSWGO+PV28oxyVudOxh0S2GP5wDtmMJCrXBrY7yjrGC0ZOkMVYyAQif1DvDLfj+66ST
 xFo4U7i+uRny2HhyultXmeQD2pEqSLyyFipik3Xj7i8/HeQk78fe6qNaDrXrNIor1JVTWujwXC9
 0w907Mk00NI6DaGQX6A9sEx0DRAII5PmkdFDpBVIwO0Mkxpdi96dw0JIXNlfhaZdK7e+atW6jgM
 dc1XBjJVQMb/neIdLLllc2Irxdx5p/EdOp1lTOoh8RPjw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2c5e8a08dd82050f;
	Fri, 27 Nov 2026 13:25:00 +0000
X-Mizu-Trace-ID: 2c5e8a08dd82050f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 21:24:56 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] docs/zh_CN: align translation paths and update
 guides
Message-ID: <awmEqJSOd8wKUPTM@wyuan.org>
References: <20261029124429.294868-1-dzm91@hust.edu.cn>
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
In-Reply-To: <20261029124429.294868-1-dzm91@hust.edu.cn>

On Thu, Oct 29, 2026 at 08:44:20PM +0800, Dongliang Mu wrote:
> Several Chinese translations are no longer at the same relative paths as
> their English originals, and some Original fields are stale. This series
> moves the translations to matching paths, adjusts their indexes, and
> removes stale Original fields. It also updates selected translations to
> newer English commits.
> 
> v2->v3:
> - Remove unused top-level labels from the translated V4L driver index,
>   process index, and magic-number guide.
> - Update the zh_TW admin-guide README reference to the relocated zh_CN
>   GDB debugging guide.
> 
> v1->v2:
> - Drop the unused top-level readme_zh label from the translated
>   admin-guide README.
> 
> Dongliang Mu (9):
>   docs/zh_CN: update admin-guide/index.rst translation
>   docs/zh_CN: update admin-guide/README.rst translation
>   docs/zh_CN: add media administrator guide translations
>   docs/zh_CN: reorganize process debugging guides
>   docs/zh_CN: update magic-number to match upstream
>   docs/zh_CN: reorganize media driver API translations
>   docs/zh_CN: move GFS2 translations into filesystems/gfs2
>   docs/zh_CN: update networking/xfrm/xfrm_proc.rst translation
>   docs/zh_CN: remove stale Original fields from SCSI and IPE
>     translations

Forward Alex's comment to this series in what's cooking (Nov 2026, #05)

| Some of patches are conflict with latest documents, please sync up and
| resend. Thanks!

Thanks.
