Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810413;
	b=EWGze9cVBBHAOjapUChdlDYQ2LcUHC58MYwbIy9WtKDJKGNDh/IcWGxRr1orTtbxyrcs
	 pybjNdnTjHJEIg/NGTbc/gCx6NHXupBPz6csqILcZvGB9q3+JzDwz6dqEnwaJIw/3BEZR
	 8x5qRxX92eVK9GhGN3V0WCXitMpd6hHvvpJvaPf8eP6yZRDbuhwdul30Vaf6T2RtFjWc2
	 erC448T0imuArtXzPqRh7K/f8cNccOVNtz33RqT5DhWOIJiIxPwElks+Hz8IUuSq0xcNJ
	 +IGkQpWAsf2zbJPaNVlQcGijB/UhugumBLkgVS38iu2A4n0fDXIiYt+jHlgYMyooD6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810413;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=wQ4Ea92LuSsjCfPccEyJNxbltDfTgYAS7193tyu/dr8=;
	b=DTSIJrg2oPv+jKDO/DjUdAXyITx3XylpAjUP+wrOEx3Fnw6r0MUwUVjRzBzPUozdDots
	 8mDf1Y+mBHqm+WOfO0im39WJNhKlTTBtkgjqw1/MD9EgGdq67DYG27x214G8oXyEMnFg0
	 YBO1AyUC/3uUtH+WAdv0V0XhxUgH91IhDmq9+Z+Kve/Knorkbeab8TAk5pGsAvx79dDSZ
	 DBLZIxp08CSusnfnCZaB4LVb6n5DYzYOhODnSo/zCYJj9IA2vKNpSzeD3AjA9mgoTFHWe
	 RMTE2Rgql/fIw3zGYe/Kat8H5I046chwZLACJiYIBFZnfh1LCJyub+5bLk9FidY6wMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S2xrgMCp;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58810606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58810606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S2xrgMCp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795810411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQ4Ea92LuSsjCfPccEyJNxbltDfTgYAS7193tyu/dr8=;
	b=S2xrgMCp6T3ovyUvw9XVec2YbYSXxhU3g0m+H4p8YVsF+xKUpYujHZYYFwC0QgK/s36mP3
	4qNcdE+1H1bmcFO9zY0Ssc+HzOZgHcEVOusH982SbRqyTR6RA6HiReYJBN19MpH1RMukVL
	tcw8gHaTEYU8AZTPvkUehavhl7xNtp4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-TakUJ4rLMbCsJqdj2AhIzw-1; Fri,
 27 Nov 2026 20:13:27 +0000
X-MC-Unique: TakUJ4rLMbCsJqdj2AhIzw-1
X-Mimecast-MFC-AGG-ID: TakUJ4rLMbCsJqdj2AhIzw_1795810403
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6BDB218002F5;
	Fri, 27 Nov 2026 20:13:22 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC5075B1;
	Fri, 27 Nov 2026 20:13:12 +0000 (UTC)
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
Subject: [PATCH v10 03/10] objtool: Always pass a section to validate_unwind_hints()
Date: Fri, 27 Nov 2026 21:12:14 +0100
Message-ID: <20261127201221.434876-4-vschneid@redhat.com>
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

When passing a NULL @sec to validate_unwind_hints(), it is unable to
properly initialize the insn_state->noinstr passed down during
validation. This means we lose noinstr validation of the hints.

That validation currently happens when 'opts.noinstr' is true but
'validate_branch_enabled()' isn't.
In other words, this will run noinstr validation of hints:
  $ objtool --noinstr --link [...]
but this won't:
  $ objtool --noinstr --link --uaccess [...]

Always pass a valid section to validate_unwind_hints(), so that noinstr
validation of hints happens regardless of the value of
validate_branch_enabled().

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 tools/objtool/check.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 6b1d0e2af00c9..1b6fab9334566 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4011,13 +4011,8 @@ static int validate_unwind_hints(struct objtool_file *file, struct section *sec)
 
 	init_insn_state(file, &state, sec);
 
-	if (sec) {
-		sec_for_each_insn(file, sec, insn)
-			warnings += validate_unwind_hint(file, insn, &state);
-	} else {
-		for_each_insn(file, insn)
-			warnings += validate_unwind_hint(file, insn, &state);
-	}
+	sec_for_each_insn(file, sec, insn)
+		warnings += validate_unwind_hint(file, insn, &state);
 
 	return warnings;
 }
@@ -4460,6 +4455,21 @@ static int validate_functions(struct objtool_file *file)
 	return warnings;
 }
 
+static int validate_file_unwind_hints(struct objtool_file *file)
+{
+	struct section *sec;
+	int warnings = 0;
+
+	for_each_sec(file->elf, sec) {
+		if (!is_text_sec(sec))
+			continue;
+
+		warnings += validate_unwind_hints(file, sec);
+	}
+
+	return warnings;
+}
+
 static void mark_endbr_used(struct instruction *insn)
 {
 	if (!list_empty(&insn->call_node))
@@ -4849,7 +4859,8 @@ int check(struct objtool_file *file)
 		int w = 0;
 
 		w += validate_functions(file);
-		w += validate_unwind_hints(file, NULL);
+		w += validate_file_unwind_hints(file);
+
 		if (!w)
 			w += validate_reachable_instructions(file);
 
-- 
2.56.1

