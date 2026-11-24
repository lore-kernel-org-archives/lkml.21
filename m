Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551251;
	b=jVurcrUtBQwODrrkE3WZUI/UxdXZjPxG1z6rQncjMgmwp60tv3mooC/gzvo3TQny2/GR
	 48Uv+AkWtXVbeRfhkRX5CeNoNecjyHkjg4zYfoes8M9aKO5SZY5vmBE+m+5TCjCGQWyOQ
	 hg8voHwmzL1YtoZhktbqCT7wjh3zhT7jXqdy1wfkxdxpgFPPI1yEHLcZNgrm1fSgBaMj2
	 kjs0Ep4Xhnd42VsJjWrMmQ3Ykx0tqpvYUjQ3JLLF555VGoDUcO60mophBpmckW0N9EHDg
	 PR7bsqznBMm0DJJoP72QterZj8QQzbkCBnZUNm3TsR4RlWAsP3bo7P/7DulFbKIzAag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551251;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=9Fpa+qTmEVAMmPdogRCF2tnqKlnfE7k0kPiEaWQldoI=;
	b=xRT8btrogZP3kYaSPvnUlqQq4yXN2QPjePdBHGdqIAidZ1opXS63tfTcaQ/t9aZoHqxt
	 ejBnQuvuzjbyO3Vv7LtHzGkIO8ceZ715cFSyTdsxZ7ITTtX1IoNfvj1ldNgATMcX8yJ26
	 9WLx+WLusdpL4uWb2IoSVthW72iaVhg5y4EkaEOtJHDZooAEmqy18Gun4m15dTGRaBkS6
	 PmYoHvRCVJFRuA6F4UL+u4qr1BxbLDxZMKWglB2TAQIt+EUcc8nyasyaG2MBwk0BcsTCg
	 dlDegLAf14b8Brz0Uo2GJ5ELdWkifpAE4q4R9QPvp6Htnjs8lpTAVXtnC+J558NSGfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M+HgFmJG;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD660A261B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AAD660A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M+HgFmJG
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso2623788a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551251; x=1796156051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Fpa+qTmEVAMmPdogRCF2tnqKlnfE7k0kPiEaWQldoI=;
        b=yWKEBffPbGovsr5oEdFsBG8mWwFYLimUMKX008tcoED0AJuVoA0RKsgSmuJmHPwJAr
         Zk5IKfJeSSHhqZ2fub1p/HxkLD3l+6607IFPqcl4VD2/tF/ZnMDzBv+76qw98snR8AG9
         sjF7zDthCVQRxmoDi3WTT0VnP/U/fAsr9RlFtVWLVjs/ihnjFNqX/OU43RcZ2tJWf9Gb
         mthFEgLvNI0qAuyLp6f4XQTWyvDuXc9PafKvpA6qZYz0cU1N78SXqkeTTiKN/+p92HkK
         RCIe8wpzwtOV9Lr+q8tvxbnSldFOZJKAb0s92R+kK9cYI8fIcn5EUo0hDGn8C3ZyyyiP
         Xg9A==
X-Forwarded-Encrypted: i=1; AL+hErERcsFbWbi7eygTwPotBJK7N/x4U6VI0Bm7qTDdiRWF9RB/Ct00sT62JgLyECxSlDlh2aE9vqO9nDIv87c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rkYLQlj0wmc34dnLcogUbN5S7IdUSRe/GaSe0zaSr328Jxlk6
	DEEkAqifw4jKGx4OVlod5RTKIO5HYjuHwi+WwgYTk/Ej2vaOu5AKoYg1c7FYya0RQjS+iVSdnVL
	8fC8aWDlrkC+0vO4mREU0T1AADEvYjLpjQZuvcQ8bFsw2wB30lWvDEUgx2A/Zt/T8eXW0teLESG
	eX+Axx2nzqpeg9PbPtsDf0cZCxCc/S6YiWuIkkRwJfvct37YICTOOYJLAuKjaWbDGN3e/E0cS92
	4F0Erhs+PhpSJDIOhYmVuw=
X-Gm-Gg: AZFdTZfvq49TKwl3XV6DgpVYa7ifkQYNz6iqQKRWtHhHSbMdX42HrJVzYpZCJM+HfMO
	0cyOfrZqGiYyNK4KhFnwTxqFwKzmGqxdctnBUl1h5nJhNTk/cwdgMZ5FGh2aEgtz/RALy2+Vsq3
	+IKuG4XgGCyYQIVLoU9aJecDlVz2eJXYoYCWeMBcLSyPbynPoc8kbX2vy0wZvbgU5ucZr9DX4gW
	0h45CfFTFccmUb6PDtafDk5hNn6byF8KhaCCSpCeXYA9xbaoWH40tduN/reFFy2t7VZfk+QE53U
	HQIcSd2BCdIBW3vRVvXWOrOgSYSzASL6riZUlS3fi4Gfpj+ILsFiYAWmf8C83CPp3HGxWms0p24
	Uifkr+X1h6ISY1IYy2b6chGzubrXg+wFeDhvV//BgIIDkWPU3oOgjzVOS2g2FQzIPbsBsQqlJ1g
	0VhliPdhyft2UO1mk2XvEZailjm4i3g4tOZlDrsxA62w==
X-Received: by 2002:a17:90b:5543:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3b41c8dd197mr14660390a91.11.1795551250813;
        Tue, 24 Nov 2026 12:14:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm12262987a91.1.2026.11.24.12.14.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210ec7cb34so3805746d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551249; x=1796156049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Fpa+qTmEVAMmPdogRCF2tnqKlnfE7k0kPiEaWQldoI=;
        b=M+HgFmJGC/pcK03QgAhKT94to+ZwQ5V/8uPVAKH6exU4zryz+YDSnXAJeUSB3H43Sn
         zAXvdzQWr8KtXTs6auscimiuMfJPbkI0Lh5vTYLXhaAUgyASOykzE88FfUhYRWbLP0S3
         rcNMoQjkiWGW6jc7/9vgzzqit/OBrkNIrM4yY=
X-Forwarded-Encrypted: i=1; AL+hErEGwF5+81lZ7QOgtkuCSxXAPqGROZ6gYpYJHPdyP7Qy1kxjzEcmlhN3MDuM333UdUT/qd+8o76BJCKCbCY=@vger.kernel.org
X-Received: by 2002:a05:6214:d61:b0:915:3066:2035 with SMTP id 6a1803df08f44-9213498a6c2mr285388456d6.7.1795551249597;
        Tue, 24 Nov 2026 12:14:09 -0800 (PST)
X-Received: by 2002:a05:6214:d61:b0:915:3066:2035 with SMTP id 6a1803df08f44-9213498a6c2mr285387846d6.7.1795551249068;
        Tue, 24 Nov 2026 12:14:09 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:08 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 3/7] wifi: brcmsmac: embed macstat_snapshot in brcms_core
Date: Tue, 24 Nov 2026 21:13:58 +0100
Message-ID: <20261124201402.3499613-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-4-rosenp@gmail.com>
References: <20261111042554.232998-4-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:50 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The MAC statistics snapshot is a fixed-size struct with the same
> lifetime as struct brcms_core. Embed it directly instead of allocating
> it separately, removing one kzalloc()/kfree() pair and its OOM error
> path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmsmac/debug.c    |  2 +-
>  .../net/wireless/broadcom/brcm80211/brcmsmac/main.c | 13 ++-----------
>  .../net/wireless/broadcom/brcm80211/brcmsmac/main.h |  2 +-
>  3 files changed, 4 insertions(+), 13 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
