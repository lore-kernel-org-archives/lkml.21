Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810435;
	b=h2AGSSyNfdvuB+7+ZihQ5RGo2+0R0IRYI5argUeYYW6xVRpPV5DAHDg8hvhvtTUfIfJ4
	 VC/8vVdpL/330rujgmb47r4WfVZfqO+W8x308ktFWrdorK/vtFhl0QqUzc6O4wqfbA2G/
	 LQK1HSk/f2jAFb3D9f47pKJyx9uhBcKSzMjCS9gz0KMVhAl8+fbeVB9CQsQUJh8DLtJnX
	 3YBNQFPFGgifrGuYB9UhHm8bZa38OuMIbvv1rlf7xvmug+SaHoGeXekb2aW82hjtbAcrc
	 oUeaYPOADYgfVL9ebpdfjO3gZmLPScJbtwG/4ihxhTpcg9t4KXeNB6OefEsjhLo7dZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810435;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=QJfwTSeeJ+yb+vdh0/54TF19RXF4fHrqZ3LDnG1zeqY=;
	b=j7hnYjciAotOjb0EeUBLV53nJMRjgCKyc5QVniVM3Wmuy1SKDQuXGlCia246fH+6Kn4f
	 OhWHjHRAKzoQ1I3kaPRxgCGDhd1epogejGkcdmqyIH467S2W2gbUwVVoIpiVH35OQTju8
	 Evl4Qu8X+oJUNHmdfx3InlSHmpo05YPUmxgqaa5V0iFlHjFIeesAZSsADBfzC4JlN2WDp
	 vShkNeTOVvpO3AKm63ICOyIoIBwpnkvNBrkC755lNcIRnBm1EwBqlHibsacbTwNcXK1r5
	 XK8vVRR6BB1RFAVHlR3IlLmpU0vdG2Rurfbcq/Sb5/hT3MyliamZidQNoSEYsMQo+0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JCx+ar2F;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C206606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C206606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JCx+ar2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795810434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJfwTSeeJ+yb+vdh0/54TF19RXF4fHrqZ3LDnG1zeqY=;
	b=JCx+ar2Fkma3KO7wh81WhgU2reL2z2s+t9Jpx23/XxxvwNi8JV3f6iFQrJQLnX7iq1+zX8
	F+E/m4FojyMoU5pq+wJMBHDKaxKTFMhR35xq73ND8TfgVV8kN5alp2HaF3Rq0Rhf79b8iF
	qDHHZY7gzuSoujdbRkXEnuZZW5iapi4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-1wq_Zv78PBiGjjtMYbNPtQ-1; Fri,
 27 Nov 2026 20:13:47 +0000
X-MC-Unique: 1wq_Zv78PBiGjjtMYbNPtQ-1
X-Mimecast-MFC-AGG-ID: 1wq_Zv78PBiGjjtMYbNPtQ_1795810423
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CECA3195605E;
	Fri, 27 Nov 2026 20:13:42 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BAFF3436;
	Fri, 27 Nov 2026 20:13:32 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
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
Subject: [PATCH v10 05/10] jump_label: Add annotations for validating .entry.text key usage
Date: Fri, 27 Nov 2026 21:12:16 +0100
Message-ID: <20261127201221.434876-6-vschneid@redhat.com>
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

From: Josh Poimboeuf <jpoimboe@kernel.org>

Adding static keys to entry text needs to be done with care, as they may be
executed before a context serialization operation has been run. Add
DEFINE_STATIC_KEY_*_ENTRY() variants for those. They don't do anything
special yet; that will come later.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
[Reduced from .noinstr to .entry.text]
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 include/linux/jump_label.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/jump_label.h b/include/linux/jump_label.h
index c95350a109876..36634f08d30a7 100644
--- a/include/linux/jump_label.h
+++ b/include/linux/jump_label.h
@@ -374,6 +374,20 @@ struct static_key_false {
 #define DEFINE_STATIC_KEY_FALSE_RO(name)	\
 	struct static_key_false name __ro_after_init = STATIC_KEY_FALSE_INIT
 
+/*
+ * Objtool will warn about static keys used in early entry code, as they may
+ * be unsafe if executed before any serializing operation.
+ *
+ * The _ENTRY variants are used to tell objtool the static key is safe to be
+ * used. If using one of these _ENTRY variants, please add a comment above the
+ * definition with the rationale.
+ */
+#define DEFINE_STATIC_KEY_TRUE_ENTRY(name)					\
+	DEFINE_STATIC_KEY_TRUE(name)
+
+#define DEFINE_STATIC_KEY_FALSE_ENTRY(name)					\
+	DEFINE_STATIC_KEY_FALSE(name)
+
 #define DECLARE_STATIC_KEY_FALSE(name)	\
 	extern struct static_key_false name
 
-- 
2.56.1

