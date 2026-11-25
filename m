Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596052;
	b=BYAsDdMwv8kCBQut5vywjYBjRwcBN/DqzI8g10gmKY+OSD/+OiPnH9mOjBB3fBu2hBfX
	 VnG5/zmp2yRrSYcHV2uTY7jqL7JEij/vwYK6KUqjNaRyueNI09EvoV3cUAPEiduxUcM7b
	 yNFEq8MUuIZUg7bn4Dq7dt+12IHijAIWsxDgd6RoovpYB7bNv8YigHM8HgGvEONsF0QLP
	 25kE+4kqv5E67UnOFQdvZfuTIxfao3pbCtGGBU5k8X+SgBEo7+QJyO/D7gMmJK8bRDaMo
	 bokrTFPSiOti8SZ6dlZtn63Est8av3b1lOBl4+eMDK0H/xC3bDW9rk02Mwtx5rwcGqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596052;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=T8/KRqOd72K5yjFhgDWwGqCWV3NyJr/CRKI16NnmYbA=;
	b=VewvDr5e3RLzNwDFDoaGZ0mqVUF2TY9rBV06B5IOrV79LJUK7BHhILjQrodslCW80Wka
	 Vy+u4NnV09uJ6PrYKaRVqA9NA2xuCgQmAXnZRos0ixLDgayfanG/Obj1o15csZwSrRiSs
	 MqGa12638N6Q/B74OwDvfx/HnBEh8iaUFQOcJzCsc5SsKqZvIaywTOHT7H0rjWc74fXlc
	 Ms8sucFw3c7i7nv2t7v1cSF44ExhGke9gLq3zA50VAaZDmaHoT5Vy82dtFnsduK3CKThE
	 4lNFxAHfqG7YwdppNBJct6gOaHhOR4LbtdW1/+HXvEmVc62517HA1LQ/UgADzkUdRgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RVKJ94nk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="y/BLBIca";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAEB606A681;
	Wed, 25 Nov 2026 08:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEAEB606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RVKJ94nk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=y/BLBIca
Date: Wed, 25 Nov 2026 08:40:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596048;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8/KRqOd72K5yjFhgDWwGqCWV3NyJr/CRKI16NnmYbA=;
	b=RVKJ94nkUr13LjuBGJ+uiZl5e1aQrpPd1yq73spiNMI4HV17D6TGwOFe6LPA01W3K0AgY6
	Rtpu873AbJ0yFLvdmNj5VrSnNWGDzaOgJNmVtrYYy09cm1SXzTNhjsOC/IbMTkJxoFuTyb
	ZFVPgBxwBgvf1Zah7bc02BpGogm641c80OFYII95h2omJ40JanuRRUUkWtFDbOIOMDEe5c
	4GaanWeFORkO8zX0UbDe/0jGFWzctVwT2QqaE2FYwkdnTS18SkSb3rCIHRG8kBwKtt18lV
	v1nTCNo4sP2rY/5koy8t9Q0P+WoxUGXyr49G0uRJiKOC+dtGTsNkIxh6U2rnzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596048;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8/KRqOd72K5yjFhgDWwGqCWV3NyJr/CRKI16NnmYbA=;
	b=y/BLBIcaddbuqiLrew6F05tbkiy7AWzLTSxsoBGIr04Sblk10dyltVaeEtllDPVgz+6Tpe
	JZTOZ+tsARWphDAQ==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Reject changed functions without an
 ftrace call site
Cc: Puranjay Mohan <puranjay@kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261022171637.3298443-3-puranjay@kernel.org>
References: <20261022171637.3298443-3-puranjay@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559604701.92412.13543579922017019723.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     dee7e5a566e777ec9c5d1dfc61bc1320412cab46
Gitweb:        https://git.kernel.org/tip/dee7e5a566e777ec9c5d1dfc61bc1320412=
cab46
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Thu, 22 Oct 2026 10:16:35 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:38:31 -08:00

objtool/klp: Reject changed functions without an ftrace call site

Livepatch redirects a function through its ftrace call site.  If a
changed function doesn't have one, klp-build succeeds but the patch
module fails to load:

  livepatch: failed to find location for function 'nsproxy_free'
  livepatch: failed to patch object 'vmlinux'
  livepatch: failed to enable patch 'livepatch_nsproxy'

This is easy to hit because the kernel's 'inline' implies notrace, so
any inline function which the compiler emits out of line can't be
patched.

Make klp diff fail for any changed function which has no __mcount_loc
entry in the original object.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
Acked-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20261022171637.3298443-3-puranjay@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/include/objtool/elf.h |  1 +-
 tools/objtool/klp-diff.c            | 44 ++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+)

diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objt=
ool/elf.h
index a82517a..f7e6a65 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -98,6 +98,7 @@ struct symbol {
 	u8 klp		     : 1;
 	u8 dont_correlate    : 1;
 	u8 fake		     : 1;
+	u8 traceable	     : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
 	struct section *group_sec;
diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index 34da55e..95d0d86 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -1098,6 +1098,47 @@ static int mark_changed_functions(struct elfs *e)
 	return !changed ? 1 : 0;
 }
=20
+static void mark_traceable_functions(struct elf *elf)
+{
+	struct section *sec;
+	struct reloc *reloc;
+
+	sec =3D find_section_by_name(elf, "__mcount_loc");
+	if (!sec || !sec->rsec)
+		return;
+
+	for_each_reloc(sec->rsec, reloc) {
+		struct symbol *func;
+
+		func =3D find_func_containing(reloc->sym->sec,
+					    reloc->sym->offset + reloc_addend(reloc));
+		if (func)
+			func->traceable =3D 1;
+	}
+}
+
+/*
+ * Livepatch redirects functions through their ftrace call sites, so a funct=
ion
+ * without one can't be patched.
+ */
+static int validate_traceable_functions(struct elfs *e)
+{
+	struct symbol *patched_sym;
+	bool error =3D false;
+
+	mark_traceable_functions(e->orig);
+
+	for_each_sym(e->patched, patched_sym) {
+		if (!patched_sym->changed || patched_sym->twin->traceable)
+			continue;
+
+		ERROR("%s: no ftrace call site, can't patch", patched_sym->twin->name);
+		error =3D true;
+	}
+
+	return error ? -1 : 0;
+}
+
 static int clone_included_functions(struct elfs *e)
 {
 	struct symbol *patched_sym;
@@ -2260,6 +2301,9 @@ int cmd_klp_diff(int argc, const char **argv)
 	if (ret > 0)
 		return 0;
=20
+	if (validate_traceable_functions(&e))
+		return -1;
+
 	e.out =3D elf_create_file(&e.orig->ehdr, argv[2]);
 	if (!e.out)
 		return -1;
