Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810422;
	b=2idBcl2j5xNTREUUnQ5DEa+zAZl0AXfcudKfXOa1/YtZgZ8DGpFsjbpK1WvZkQIHpxHC
	 0SbHljclffdXjBf93DWFhdb8RytubpfnA/lcpyz/D3bXqU6kfOiWcXmlzZaY01asMBZp2
	 nTsZRHVrANE4p0QmBv8Gz7BQ/HlSZHi2L/75hVeH0kZUqW2jCXONwExr7lkir1Rg2Vv60
	 Y5sf6VYqEQDj0nhg8gzeqG9VekVDx8/neNQRMPMuHvX72zXGp79Mb0AuTjX1ZCK01klQQ
	 khezkATAypYUPhbH3KosX+PD/EL7+5eWrcAV14dsQUWljpzyn0nm4pwClvtz2Fbf+UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810422;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Ktd0gbm0hisA+eBjXiYYrjMkzRDJAOVOab1/LXcsi3k=;
	b=SOIrg5F1K5DTbq0qBDCUW9QUV2/97WIegeubo3TAECUbBOrr0c2j+0uSPhGHa4lFKLdt
	 iTOhXIiQwOWlkv8G8hfWs37OUWze2Esm9QpS2cfndRMl/P9I6GUM39wUw1jDwSQmJ+fhe
	 oJrF43SGP1zEAk1PVJYKCoVIepKZ7sGIO2rJt/iKMoadhzA3fk7fylm4au6wP/EuqSiPg
	 ewKpsdD51rUM+f9S8YibDeBLR+ItfbRzzH3QtVugJymSOPyMFjWjzZy28a/mU8Sp1jO6g
	 TQ+OKdeIyMpmtwBozIfk7SyTXAADr/+7yjfC380Xp6YrdHFrnpZRfvPTY4YfTs4M0tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="I/FXETdP";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778A1606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 778A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I/FXETdP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795810420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ktd0gbm0hisA+eBjXiYYrjMkzRDJAOVOab1/LXcsi3k=;
	b=I/FXETdPnMOjt5TwRmnUEMWMB1auSj06S31uj8Ild1CEdxFkI63Ux7ufhC0oQotF66NGft
	OvEjBqJybFKhxkwx6ExjmxcGhZ+pDObZVzEmvLi7NZkR4JH5GLyzvp9dMZWFDTLG05nK3R
	LKHrvp2gD/ytpXxS8W2SuBaubUWJIqs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-540-S12Ety3YNuauQIOXG0TxVA-1; Fri,
 27 Nov 2026 20:13:37 +0000
X-MC-Unique: S12Ety3YNuauQIOXG0TxVA-1
X-Mimecast-MFC-AGG-ID: S12Ety3YNuauQIOXG0TxVA_1795810412
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 567521956069;
	Fri, 27 Nov 2026 20:13:32 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CBF50436;
	Fri, 27 Nov 2026 20:13:22 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Dan Beimborn <Dan.Beimborn@qube-rt.com>,
	"Pak Hung Vincent Chiu" <pak-hung.chiu@qube-rt.com>
Subject: [PATCH v10 04/10] x86/retpoline: Make warn_thunk_thunk .noinstr
Date: Fri, 27 Nov 2026 21:12:15 +0100
Message-ID: <20261127201221.434876-5-vschneid@redhat.com>
In-Reply-To: <20261127201221.434876-1-vschneid@redhat.com>
References: <20261127201221.434876-1-vschneid@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Objtool now warns about it:

  vmlinux.o: warning: objtool: .altinstr_replacement+0x28e1: call to warn_thunk_thunk() leaves .noinstr.text section

Mark it noinstr.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/entry/entry.S     | 3 ++-
 arch/x86/kernel/cpu/bugs.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/entry/entry.S b/arch/x86/entry/entry.S
index 2bc217bb5475b..4f85cdb5011fc 100644
--- a/arch/x86/entry/entry.S
+++ b/arch/x86/entry/entry.S
@@ -40,6 +40,8 @@ SYM_FUNC_START(__WARN_trap)
 SYM_FUNC_END(__WARN_trap)
 EXPORT_SYMBOL(__WARN_trap)
 
+THUNK warn_thunk_thunk, __warn_thunk
+
 .popsection
 
 /*
@@ -60,7 +62,6 @@ EXPORT_SYMBOL_FOR_KVM(x86_verw_sel);
 
 .popsection
 
-THUNK warn_thunk_thunk, __warn_thunk
 
 /*
  * Clang's implementation of TLS stack cookies requires the variable in
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 56eac5611c318..caf8c3c76b544 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -3771,7 +3771,7 @@ ssize_t cpu_show_vmscape(struct device *dev, struct device_attribute *attr, char
 }
 #endif
 
-void __warn_thunk(void)
+void noinstr __warn_thunk(void)
 {
 	WARN_ONCE(1, "Unpatched return thunk in use. This should not happen!\n");
 }
-- 
2.56.1

