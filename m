Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773543;
	b=tDTMcemrfkJuXDHqMOUaqKS5B+gi1CwPdYvrIwZbTyl+d6b7C2QaEFTPFTk2+7quBksC
	 SQn2xuMR2Qjoy+oLFpWTxfZ54vcP7V5Zv409PtgFx/SaI+couM3HT0HPxl9astI2/jwIi
	 QFWKeMCCiyjt04La6O5b+x9ViLjxh0j9oHj73V9KdU1Y4QgKJVnk/zsNPAfylK/Az33wZ
	 FSSPnydkYM6QSrFqswrMLwfHD1hsDx5buZXuFAWt0Sb0QNcFSmUe3P5IvLHhNCfPSEf/g
	 X7rL2/Mw8jqe+I1NkInD+WrJSNLBmWxwdQNsbY7JeiK1j4hhMF95bFNeGlnuerQad9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773543;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HS1h1bZTmMeyGAoFJ9k7WiesLziPXfI0iGAFPkyd0U8=;
	b=PsLWX9+uOjVOR46fr3Y1i+s3AtmGeagcTjyqWM+MVCrR4R37qbAUGx2Z0/PjRh5WCIO9
	 3RpO5UJfCqfBzEZ872/0tX2ALwqfsIQXgFAwP9/NClbiPt7+F2hQ0t1vl/uDNKkjZsjBr
	 OH/IP9UVNmrg9feO9q471WUEPeA4a6NY4xjfStxTgJtHmyXhWwv2K+9ou1KtLHduKdcZi
	 MTxYIUW21MyqYACSRzt88wjVM95ZU89U4eaTnNLajPC8hgMu6tGryNI8Z4fmCcP0hmKDp
	 vnv13ldIC5AAop/D0HEjCzKy3oIXLO9/8zqkHMjJ15qQGSd28Rk05pfLtyNPLVjP4Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="R/X+MprA";
	arc=none smtp.remote-ip=43.163.128.53
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18CF606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B18CF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=R/X+MprA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795773531; bh=HS1h1bZTmMeyGAoFJ9k7WiesLziPXfI0iGAFPkyd0U8=;
	h=From:To:Cc:Subject:Date;
	b=R/X+MprA1iiYsbVn2QorYQD4I5+6eLG6x84toLp/nIL/uCoJ7IiQsU5MqGVGgEpzC
	 BUB9O/51DNOMUYPwuyK2pL3ZGiU0nzWZqSNlHsRKVae5gDi+O2XAfpSZuRshYyuQFt
	 mrWA/yHrEjVX42dh+3MTsUcndbyEOeFcXI+CAhvk=
Received: from shuai-VMware-Virtual-Platform.. ([39.165.245.102])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id EB0908DD; Fri, 27 Nov 2026 17:58:48 +0800
X-QQ-mid: xmsmtpt1795773528tjyzhcp99
Message-ID: <tencent_D498CB0489BB9C74184B927C7393282E9806@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuK4QQFK/DEJQKnRWlXqelqaw1sONkFVjW2acjdeHZTr0FvYhkqq
	 i7lx3s3jTO+kfSEOwXC/dh5zINJKrdRKazWcucLlzXiT7w/7UtpiujZzBbjpaNJnQxPye1e3CX7l
	 V8wBP5rfOYSLdtwgR6+vUWXXd2x/lSb9Yv7mm1bh2BuhCsE599cLNgk33ZUf9fkeeBOIVArml+xY
	 9eoc+4DRsOxYTxJfF5iylk/pu+8kA3oP4VglMi+H3wlB7cPhIBOkH4tUYW7qd3kWpEddhmaLLHkU
	 mfdQNrBRhH7Qdn0fWfTMHBx/eXvCygrjMrDNu1x+zPyq+tO67HjmpZAyq9OKYZWAdullKfr8CSED
	 2in8tWCNRnvh9Sp6yVeeZnLnUkWmVgQrSGlAh55AP0ZNcyQL4JkfqzDmgiHPTcbDn8y/prMeZ9NC
	 75ZrWKuFeQvs6oKWzPmIT1bPEOjy4v1fstbfxTSHQRmgd9uBEgvi7N/ni5S1TSKKlWzzARNXX/Ai
	 W05N1vXgAwvr1cm5NjAZ2pM5uVx7TvAK8OJ67jf4v4gn0yVCjx9hYkoxSISmXs6v30TIJz+Z7IC6
	 L5RDTVV0d/5GKiz7U34iVr4iOY8KVcwdVMXdS1CZKJgAo5sbdlqqTLWKwjrv4tSVHbAoLKBhLlLo
	 7vrZvmEPabxaUsvQnpKBm3qT339DQ8GhpN9Ztnv2XEWdpXiYVuOtrWBAwBR/2hJakQgpKXjdjPX1
	 pQE97mu5V0lf6u3dYnhVr3M4eGnxBhFbsiUkRbbWKNSWjQ6mm6ohDFBIZxgWhxfNrVUcjR9/KhI6
	 q7FHppxkYynwxtdtXjNp3x1DSoQlT1AJm+Pz0LedBXnXdWGLcNKHYYKff+3jHb1hE9xvYp0AFYbl
	 9l2N0d56NfStC+d0NHIiJPG6MqxL/af8zru88V6ENuVoWdVYEfuULc6YRRHMPDjAg6dasMCX6yLc
	 09nxnPI6pjLCSh+K627UKGBDzaXDr9Psw/NyDUsqAh5gMinYoO4p1KotP0gBrfXeHmFIInHlOq+x
	 vAlZnDlMJuVc7j/76GsNAZcNWAUnznlExBMoQcJG5POV02Eo83hvvsuNwtI2o=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Shuai Liu <847807867@qq.com>
To: dm-devel@lists.linux.dev
Cc: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	linux-kernel@vger.kernel.org,
	syzbot+1eda626824b6334f5ad3@syzkaller.appspotmail.com,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] dm snap: clear pointers in alloc_area() error paths
Date: Fri, 27 Nov 2026 17:58:48 +0800
X-OQ-MSGID: <20261127095848.769985-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
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

alloc_area() vfrees ps->zero_area and ps->area on allocation failure
but leaves the dangling pointers.  When the snapshot constructor then
calls free_area() as part of teardown, it vfrees the same buffers
again, triggering a WARNING in vfree().

Set those pointers to NULL after vfree().  vfree(NULL) is a no-op,
so free_area() is safe to call multiple times.

Reported-by: syzbot+1eda626824b6334f5ad3@syzkaller.appspotmail.com
Fixes: 7c9e6c17325f ("dm exception store: refactor zero_area")
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/md/dm-snap-persistent.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/md/dm-snap-persistent.c b/drivers/md/dm-snap-persistent.c
index b587ee7330562..9f5ade4f51cec 100644
--- a/drivers/md/dm-snap-persistent.c
+++ b/drivers/md/dm-snap-persistent.c
@@ -194,9 +194,11 @@ static int alloc_area(struct pstore *ps)
 
 err_header_area:
 	vfree(ps->zero_area);
+	ps->zero_area = NULL;
 
 err_zero_area:
 	vfree(ps->area);
+	ps->area = NULL;
 
 err_area:
 	return r;
-- 
2.43.0

