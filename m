Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968278;
	b=0QV3ibNyPgYmeVDOA9MV5thjlxUdYtcRjxScT4OpaJiv95OM9P/MwRPppdNtDJoEeJGG
	 04PbcOUfWb5yNAUZAjlWB+2kpd3o02pZmG5o1dCfnckrOAPmHDNBcQq3ymz6lzg0uhaI+
	 yfCbvOp625a7ZmOCJmiaHT9fluLK9+XweyztHdgGGf4KEIRMkFX6rrWDr/rra1IFVosfd
	 MBkTmEoOEQvboWpohFiAxknmETd1/ZKkshCKkNQ3QrOEfRd68HY3omzC+YMd0gwrYlxa4
	 VUVs8/P/N7InOM+03cBCD8XJtJ2vkneydESHIH7PShS/1kaXB65r7+MbDxNnesq4i9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968278;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b6as2o+a/L5+mnNCeEf+dbLzkZciiy5XpXL9GQtNX0c=;
	b=gS3NRDCbMJB9eZYG+899SRM5JSSnvqaTvMLb5SgBrfQO2vj1/e6KTQqbHQ0DTmaHD2YM
	 sXv8Ldz8Pbai5wLq+ajc88e839w6F+8z1g3Hr10sdPvGFSh6DYy5YN5N42/RtutGjB8iY
	 3W9SwYX4e+T+stJDbXYuhaGfEOCi/b3hTSt/72PX0fS8SzJX31ti/GKzO+paB9tyEAcc/
	 QzZrlUVyGgcyFr73IwfBF5lvuvCNxw9SHWNhMUwp675QLOKj1xDpSVxMUzlGVeOENNAmF
	 vaHkxJI1xiXXRULzEKmFOPZTsJwUfATq0By6IzjEgzQy2yvloFXQ4S+sFX0rXElHt9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OronLHZ1;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B09606A883
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B09606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OronLHZ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=OronLHZ1mpBoLQeEsZ1jlmQKH8MTGWP2+rWOP9FJQtGhIzvv1WW/oYcq6BwCzDJ4APzQUtq8iGRbJ
	 E0Vhr8GF5uYzL9S0Rbo8Aj1tYctaqohP+Jb7UWLs53SQX9RMjJNJQBuXbfmAPQ5z3E3rvOUQI6GUh8
	 l4yppVDRqqhnUCcA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afd0aced4a-daf1c;
	Wed, 18 Nov 2026 10:17:51 +0800 (CST)
X-RM-TRANSID:2ee66afd0aced4a-daf1c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afd0acc8ce-c5466;
	Wed, 18 Nov 2026 10:17:50 +0800 (CST)
X-RM-TRANSID:2ee56afd0acc8ce-c5466
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: syzbot+03fdf84c0915fd48f361@syzkaller.appspotmail.com
Cc: Phillip Lougher <phillip@squashfs.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [squashfs?] general protection fault in lookup_one_qstr_excl
Date: Wed, 18 Nov 2026 10:17:48 +0800
Message-ID: <20261118021749.420-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <6af937c0.094600b6.347106.0007.GAE@google.com>
References: <6af937c0.094600b6.347106.0007.GAE@google.com>
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

The same bug is already fixed by the patch below, which is in review
together with the change that introduced the checks it repairs:

  squashfs: return -EIO on out-of-bounds directory entry in lookup
  https://lore.kernel.org/all/20261114145128.625-2-chenaibing@cmss.chinamobile.com/

squashfs_lookup() leaves the error variable holding the positive byte count
returned by squashfs_read_metadata(), and jumps straight to read_failure
when a squashfs_dir_space() boundary check fails.  ERR_PTR() then hands the
VFS a small positive value that IS_ERR() does not catch, and the first
dentry flag access crashes.  The patch routes those checks through
data_error so err is -EIO.

The report below describes the same defect through a different caller:

  https://lore.kernel.org/all/6afa2ac9.920b2b3a.148c65.003f.GAE@google.com/

Thanks,
Aibing Chen


