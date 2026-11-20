Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181510;
	b=v7vOAczIqCmZ31ptb4OWR/Jy0aswe8LPz761WClXfqRFzX2Rv3seSszJv5Uv/eQdQ/O1
	 X+b/g3baLa8rTDXqKBc2adY8fkruDEojiOHFx/RKL6OHKkfCHLGl0jEjhuS8F2cQQVavm
	 eA0M54kYmtJwNDVLND5c+D2SYaPa+6bKAS1f8KdGoiTm2IXyJTaEtg+8019ten8joc4vW
	 O2G5FXpsE2zrWdldq367uYmjA0KIghqZKiV6jYqecJuwrpcLADvaFd94Mm0x3F2Dl97o+
	 JDAilB4zaP3ZDN3mRQhndT7ahfNXTVknEhb9i6hg7+a79XRn+dBZHeig7osfb+l+ciA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xPq8vHZRjZ0W9FI56EPWdeooS/iHKvZIxdKn8ZO3tk8=;
	b=M7wqOB4tKJTZ4uTiu6GpyhWBC+67vzVHS/KI3BXzNEovV95uNk7zlBpTE49MXtd6Z3jr
	 j/y8+WJpcW1ERajOuJqcwkHK/H7f8Gfs4pTPRua1MRWX3WAs02kKkvl0FWn5Q8FfxiPRZ
	 tPFcG/lH8soia0xcwZftJcAvSdxEP1uEkdRXZWlMForDAMKR7hrhDzehv52ZzG5KGpb5h
	 tkt/5sYhs+iTDsMawv0w3YLWPNlobzM/s57PbqICeBbq0MdelhWgo9K9O++XbmFPBWNOM
	 kx0NIyrkpdA9B8IIHLunhULPa1xf3JAdipRKbxJwzCuDLHjR7TVk9Xt+GKt/ma09MiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqGiFZnr;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26343606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26343606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqGiFZnr
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d28f75d62so161749366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181508; x=1795786308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xPq8vHZRjZ0W9FI56EPWdeooS/iHKvZIxdKn8ZO3tk8=;
        b=hqGiFZnrjqYQFj881CYUJZtgImGi0ugXjpTVIWee9kUXRzlYa8/9BD81x/+zkFKwk8
         Db6t14iFQ/UnZINNbCXUWvuiqadZPfWQImoJEZZ69c5+JJUJu8MdxYvqH/BEaoeEhnED
         HTUthonTmsUiDPZ6zYrW/0oH5l3euOmv1Bk2XdsyNRXRXm7JwyjhNaXKy2h5vCBfKomd
         iXuTNYGftedtWmWCHiCAjgbNLR1YjZhAIi+Vgttbwu9+ZcoW1QOqlRLJLmefquEahX6Z
         kmJ9sS6uhjS9819doNiD8n7z6hBI0hE0SjgDO1S644sv/ie16h1NKkJz1l6+F8UHMae2
         niuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181508; x=1795786308;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPq8vHZRjZ0W9FI56EPWdeooS/iHKvZIxdKn8ZO3tk8=;
        b=PBjaugTguWbo2Q7vWdO1ce5rjHnsytDjTKxS4cBYC92+XtKKtHrXhJ5II1lSA13JwF
         fAK9MSvRc95RxX6GVA2B6x+/4+26aeHs52DPygRoJQnpl2lHcWP4OeCJDVwKCxZMVI1u
         sbY7HA92eZpwUJePQF5zfDdci6aJGnwpekQcQ1IQFLQ7+kQXTzpidh+ZXf6RARwAOiDe
         ldXML6geL75BlDr3TIiTArjrW8m8zBQScmjqFo/MV59SUMwyN8WraUP0onfJQYqOZuef
         XWnFwIaHAoCk9d19v/vAbbx8skgR5B4cfc4mKuFgyLGAluR2pc6fRsoQHDBqo7hKFPFv
         VzAA==
X-Forwarded-Encrypted: i=1; AL+hErH4STTv3s7V4zCdpmzwd1DIBXH0Dp3Q0jyySPH3hCSvhS+mLJ4+b9qwZycp6EX05cz8QwPz/8p4JCXWEyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zW67wJHDwT02LEpicskWnljAsDJB90Ndvw17bGeGldzELEByw
	i08QXAWXvD5TW+OfuPctTcRsTpp5EwpU9CIbzlGYoNKSXn4wXv5Do22p
X-Gm-Gg: AYBFou2S1vEAfHymDKM2cXlf2LnrMKrXakBa55iZG9fpEVb0zWAZ0wtAprbiiHenm40
	1xeS5UePQ/8BeDgwgRyoCtXAPL8UfM/GvnKKcV0+RAits20GDJut1TOrpANFuPqyg3svnqIUc0Q
	+Homu7aQQDVuKR5GFmzoVZtSiVMzk/Gz92OrJS1t9A81yf2i+2hcfWTUSEeeKWMJsrTl+y5UebD
	CrKkmqY2V2HFb4EpvbySbXeB2Pg84y2CF2AK4KziMgVhPEmL8nrm1VWVEJH5lyKytVM3x+W1rnE
	JHscwja3lROvz6g21rKtmPK3Mc/BZlwFHVe2GxtckTBAChSQ0kMpFTUPtwyw5DHADSfz++E/oW4
	PJKxF/moh1yAgJhiVoeU4gyL2UqJJz0qFZHRFW8DxLgGMHT202YH7ShVDPH7UbmQYbGHZZeRHRI
	zl6mtRrA3nCshHzL5yHUlT4Xi/H1wxNpnrGzUw40OXtUnzWM7WkOuElRrpkyux099WiIcyl6mFF
	YJLxg1R2F7UiTYCJ7LaKjxNueZBOiFUS9DqSgcTejc7uBk6ae2uitnmEnJsMxsUHUi2B/sMRfL0
	3jdHJESfFmPxYbL5cZqbPpv61Rsre1LCZGgpmJIOC/Rq26XTSu3mmip1B4oPclhcpe3dfJy5SwB
	us6TTPWbZPtT7enF/SnX9f/MAKv5iPvxZWcwd8AJrQgfk8EuDibMlLLo4hM/dq7o3klvuAw95t/
	4+f+EDc+8WjJb8bbKpqqXz5NbfScpq4DIXDhsFumPwvm4IPlyklUOtp5p84kEYWDei2e+HfTTE
X-Received: by 2002:a17:906:6718:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c513ab0845cmr226867666b.21.1795181508436;
        Fri, 20 Nov 2026 05:31:48 -0800 (PST)
Received: from Ubuntu.tail0f733b.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm94908766b.84.2026.11.20.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:31:48 -0800 (PST)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: syzbot+b0aebd03565f5774f7f8@syzkaller.appspotmail.com
Cc: Krystian Kaniewski <krystianmkaniewski@gmail.com>,
	hirofumi@mail.parknet.co.jp,
	linkinjeon@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [exfat?] WARNING in vfat_update_dotdot_de
Date: Fri, 20 Nov 2026 14:31:42 +0100
Message-ID: <20261120130030.b0aebd03565f5774f7f8-fix-9f08@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6aa82300.a211d2ce.1a5198.0295.GAE@google.com>
References: <6aa82300.a211d2ce.1a5198.0295.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I first asked syzbot to run the original reproducer against the unmodified
v7.4-rc1 commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4. The request was
not run because syzbot replied that #syz test is temporarily disabled.

Commit 9f08e58149dca8453bf99e0af35cbb227ded17b1 is included in v7.4-rc1.
It addresses the reported !buffer_uptodate(bh) warning by leaving
BH_Uptodate unchanged after failed write completion. Local testing of
current mainline with the original reproducers did not reproduce the
warning.

#syz fix: buffer: stop touching BH_Uptodate on write completion
