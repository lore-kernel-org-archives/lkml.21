Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464505;
	b=Vu0HRAGhXKZdTo0qmdrlnUKE5SStr+lwUhtMw0K0hLfIUTLcDyUNPqTBx6XuvU5jgH0B
	 zKI167u1YC6ObyEFhZVyrDm8UGUjBMSRDr5IxkF81Ee9Rzk0sx6HxIivsF6uy5d6QAm/G
	 Ccw0xGGAb3OOST/8Yg/idCC97TnkcjTGaRAJ7FBTrGo2xElFJXPh8KvrGMSHdw6UjJuHe
	 zwcMzdj7iPrDXSu9EsdHoFUtb9SMkk3S4xbVNnpO8YldKUOtngMr0UN0AjvQC9qNENUH9
	 IAPa1lsZ3Eq6rRlf/Qat3aD2U+arNecbmLTiQTczHTnQE8KBjYehGLl0vNQHiNf50XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464505;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=GX5aMCRIgJiZuuGkpcknd4x+6v9xITU+D6Sjcmd128Q=;
	b=BsQS3K1Lg/OIWb91UiOuvDKVcayp5RV9gp383/a9hrAH7TRwZ1L0LUqazfe9Cpx/EknQ
	 +7NeIl1e6ZNspBuSBd1Qv+NJCEGTUEBtvKTfz2JlfEYlt5nu7+SKbdtkv/cAxvvrxASTu
	 Zix3SNltbu7BSeWVTr+Z51GnwQhTsjUpt7itQdnMqrzHQRkT0djBStTcLgHV4VSXJOUd3
	 Rtsa3MTfYxxoREDhTfophKi0j4Xpvdc8P13hu9mKjEA2QrpMnL9lZMBREqngwR/bA6P89
	 OARrGJgUImpH1A+7W5mgXFwmW+vLm7pY4n/RovUAusPtUKGrUxgf1j3UD0T83AW/VTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=qBSQEEAM;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F40F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F40F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=qBSQEEAM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GX5aMCRIgJiZuuGkpcknd4x+6v9xITU+D6Sjcmd128Q=; t=1795464504; x=1796328504; 
	b=qBSQEEAMlxqOsAKu2jEu5/fKNF1hjUU3G9f93AVvBRsSx/jo66f1ML8DQFeq5apUy9jKnZKe2Nj
	UDATolUlrUMdTuHZVFWeAcFeFx3wjwgzkMuBRGq4hnQs2PL7On/lg2HDZzhUDcR5SvwIK74IaqNMR
	VjnWhOi+btZ9drk2zz5hLZtrhJDbgjYQdJWpGV3wl9m+Ca0SrrFYZVEEMcDRIBsw+CvpR+QgrXPTZ
	qeVWPUSkjUfIuUNh1YwFwkGYAhcB1j2jSj/BQh6LUoDJrsiu2j1vXeH4pvpDcevM+/PVPNyQpX4LE
	3nEupjiJCJzlA90ElktNwPZNMUdMuimjwr7A==;
Received: from [49.207.211.146] (helo=[127.0.1.1])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xVaKi-006jgv-4Z;
	Mon, 23 Nov 2026 15:08:12 -0500
From: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Date: Tue, 24 Nov 2026 01:37:54 +0530
Subject: [PATCH 2/2] MAINTAINERS: Add missing files to KDUMP subsystem
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-fix-kexec-kdump-maintainers-v1-2-79c6a6144de4@csail.mit.edu>
References: <20261124-fix-kexec-kdump-maintainers-v1-0-79c6a6144de4@csail.mit.edu>
In-Reply-To: <20261124-fix-kexec-kdump-maintainers-v1-0-79c6a6144de4@csail.mit.edu>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
X-Mailer: b4 0.13.0

The KDUMP entry covers crash-reservation code and the vmcore interface,
but omits the crash-reservation header and the vmcoreinfo implementation
and header. It also omits the dedicated kexec/kdump and vmcoreinfo sysfs
ABI documentation.

Add these files to KDUMP so that scripts/get_maintainer.pl can recommend
the subsystem maintainers and kexec mailing list for changes to them.

Signed-off-by: Srivatsa S. Bhat (Microsoft) <srivatsa@csail.mit.edu>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bb4d9c20db06..bb8e1c414394 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14429,12 +14429,18 @@ M:	Pratyush Yadav <pratyush@kernel.org>
 L:	kexec@lists.infradead.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
+F:	Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
+F:	Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+F:	Documentation/ABI/testing/sysfs-kernel-vmcoreinfo
 F:	Documentation/admin-guide/kdump/
 F:	fs/proc/vmcore.c
 F:	include/linux/crash_core.h
 F:	include/linux/crash_dump.h
+F:	include/linux/crash_reserve.h
+F:	include/linux/vmcore_info.h
 F:	include/uapi/linux/vmcore.h
 F:	kernel/crash_*.c
+F:	kernel/vmcore_info.c
 
 KEENE FM RADIO TRANSMITTER DRIVER
 M:	Hans Verkuil <hverkuil@kernel.org>

-- 
2.43.0

